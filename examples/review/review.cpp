#include <iostream>
#include <list>

using namespace std;

// make a struct for an instruction
struct instruction {
  string opcode; // operation 
  string dest;   // dest register
  string src1;   // source register 1
  string src2;   // source register 2

  instruction(string op, string d, string s1, string s2)
    :opcode(op), dest(d), src1(s1), src2(s2) {}
};

ostream& operator << (ostream& cout, instruction &i)
{
  cout << i.opcode << " " << i.dest << ", " << i.src1 << ", " << i.src2;
  return cout;
}

int count = 8;

// Base class for expr
class expr {
public:
    virtual ~expr() {}
    virtual int evaluate() = 0;
    virtual string print_assembly() = 0;
};

class number: public expr {
   int num;
public:
  number(int anum):num(anum) {}
  
  virtual int evaluate() { return num; }
  
  string print_assembly() {
    int reg = ::count++;
    cout << "AND R0, R0, 0" << endl
         <<  "ADD R" << reg << ", R0, " << num << endl;
    return "R" + to_string(reg); // 
  }
};

// represent addition of two expressions
class addition: public expr {
  expr *e1_;
  expr *e2_;
public:
  addition(expr *e1, expr *e2):e1_(e1), e2_(e2){}
  virtual int evaluate() {
    return e1_->evaluate() + e2_->evaluate();
  }
  virtual string print_assembly() {
    int reg = ::count++;
    string r1 = e1_->print_assembly();
    string r2 = e2_->print_assembly();
    cout << "ADD R" << reg << ", " << r1 << ", " << r2 << endl;
    return "R" + to_string(reg);
  }
};


// represent multiplication of two expressions
class multiplication: public expr {
  expr *e1_;
  expr *e2_;
public:
  multiplication(expr *e1, expr *e2):e1_(e1), e2_(e2){}
  virtual int evaluate() {
    return e1_->evaluate() * e2_->evaluate();
  }
  virtual string print_assembly() {
    int reg = ::count++;
    string r1 = e1_->print_assembly();
    string r2 = e2_->print_assembly();
    cout << "MUL R" << reg << ", " << r1 << ", " << r2 << endl;
    return "R" + to_string(reg);
  }
};

// class for subtraction
class subtraction : public expr {
  expr *e1_;
  expr *e2_;
public:
  subtraction(expr *e1, expr *e2):e1_(e1), e2_(e2){}
  virtual int evaluate() {
    return e1_->evaluate() - e2_->evaluate();
  }
  virtual string print_assembly() {
    int reg = ::count++;
    string r1 = e1_->print_assembly();
    string r2 = e2_->print_assembly();
    cout << "SUB R" << reg << ", " << r1 << ", " << r2 << endl;
    return "R" + to_string(reg);
  }
};

// class for division
class division : public expr {
  expr *e1_;
  expr *e2_;
public:
  division(expr *e1, expr *e2):e1_(e1), e2_(e2){}
  virtual int evaluate() {
    return e1_->evaluate() / e2_->evaluate();
  }
  virtual string print_assembly() {
    int reg = ::count++;
    string r1 = e1_->print_assembly();
    string r2 = e2_->print_assembly();
    cout << "DIV R" << reg << ", " << r1 << ", " << r2 << endl;
    return "R" + to_string(reg);
  }
};

// class for negation
class negation : public expr {
  expr *e1_;
public:
  negation(expr *e1):e1_(e1){}
  virtual int evaluate() {
    return -e1_->evaluate();
  }
  virtual string print_assembly() {
    int reg = ::count++;
    string r1 = e1_->print_assembly();
    cout << "AND R0, R0, 0    #clear out R0" << endl;
    cout << "SUB R" << reg << ", R0, " << r1 << endl;
    return "R" + to_string(reg);
  }
};


int main()
{
  instruction add("add","r1","r2","r3");
  instruction load("load","r2","r5","0");
  
  cout << add << endl;
  cout << load << endl;


  std::list<instruction> inst_list;
  inst_list.push_back(add);
  inst_list.push_back(load);
  
  for (auto i : inst_list)
    cout << i << endl;


  expr *e1 = new number(5);
  expr *e2 = new number(10);
  expr *e3 = new addition(e1, e2);       // (5+10)
  expr *e4 = new multiplication(e1, e2); // (5*10)
  expr *e5 = new addition(e3,e4);        // (5+10) + (5*10)

  cout << e5->evaluate() << endl;

  e5->print_assembly();
	  
  return 0;
}
