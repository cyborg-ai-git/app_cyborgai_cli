---
name: ⚡ Performance Issue
about: Report performance problems or optimization opportunities
title: '[PERFORMANCE] '
labels: ['performance', 'triage']
assignees: ''
---

## ⚡ Performance Issue

<!-- Describe the performance problem -->

## 📊 Performance Metrics

### Current Performance
- **Operation**: [e.g., startup time, file loading, search]
- **Current Time**: [e.g., 5.2 seconds]
- **Expected Time**: [e.g., < 1 second]
- **Frequency**: [e.g., every startup, per search query]

### Measurement Method
<!-- How did you measure the performance? -->

```bash
# Commands used to measure performance
time cargo run
# or
./scripts/run_benches.sh
```

## 🔄 Steps to Reproduce

<!-- Steps to reproduce the performance issue -->

1. Start the application
2. Navigate to [specific feature]
3. Perform [specific action]
4. Observe slow performance

## 🖥️ Environment

**System:**
- OS: [e.g. macOS 14.0, Ubuntu 22.04, Windows 11]
- Architecture: [e.g. x86_64, arm64, M1/M2]
- CPU: [e.g. Intel i7-12700K, Apple M2]
- RAM: [e.g. 16GB]
- Storage: [e.g. SSD, NVMe]

**CyborgAI CLI:**
- Version: [e.g. 0.1.0]
- Build Type: [e.g. debug, release]
- Compilation Flags: [if any custom flags used]

**Rust Environment:**
- Rust Version: [e.g. 1.75.0]
- Cargo Version: [e.g. 1.75.0]
- Target: [e.g. x86_64-apple-darwin]

## 📈 Performance Data

### Benchmarks
<!-- Include benchmark results if available -->

```
Paste benchmark output here
```

### Profiling Data
<!-- Include profiling information if available -->

```
Paste profiling output here (flamegraph, perf, etc.)
```

### Memory Usage
<!-- Memory consumption information -->

- **Peak Memory**: [e.g. 150MB]
- **Average Memory**: [e.g. 80MB]
- **Memory Leaks**: [Yes/No]

## 🔍 Analysis

### Suspected Cause
<!-- What do you think is causing the performance issue? -->

- [ ] Inefficient algorithm
- [ ] Memory allocation/deallocation
- [ ] I/O operations
- [ ] Network requests
- [ ] Large data structures
- [ ] Unnecessary computations
- [ ] Lock contention
- [ ] Other: [describe]

### Affected Components
<!-- Which parts of the application are affected? -->

- [ ] Chat interface
- [ ] File explorer
- [ ] Git operations
- [ ] Settings panel
- [ ] Help system
- [ ] Core engine
- [ ] UI rendering

## 💡 Proposed Solutions

### Optimization Ideas
<!-- Suggest potential optimizations -->

1. **Solution 1**: [Description]
   - Implementation: [how to implement]
   - Expected Improvement: [estimated performance gain]
   - Complexity: [low/medium/high]

2. **Solution 2**: [Description]
   - Implementation: [how to implement]
   - Expected Improvement: [estimated performance gain]
   - Complexity: [low/medium/high]

### Alternative Approaches
<!-- Other ways to solve this problem -->

## 🧪 Testing Strategy

### Performance Tests
<!-- How to test the performance improvements -->

- [ ] Benchmark before and after changes
- [ ] Test on different platforms
- [ ] Test with various data sizes
- [ ] Memory usage profiling
- [ ] Load testing (if applicable)

### Regression Prevention
<!-- How to prevent performance regressions -->

- [ ] Add performance benchmarks to CI
- [ ] Set performance thresholds
- [ ] Regular performance monitoring

## 📊 Impact Assessment

### User Impact
- [ ] Critical (application unusable)
- [ ] High (significantly affects user experience)
- [ ] Medium (noticeable but manageable)
- [ ] Low (minor optimization opportunity)

### Business Impact
- [ ] Affects user adoption
- [ ] Increases resource costs
- [ ] Reduces productivity
- [ ] Competitive disadvantage

## 🔗 Related Issues

<!-- Link to related performance issues -->

- Related to #[issue number]
- Depends on #[issue number]
- Blocks #[issue number]

## 🏷️ Suggested Labels

<!-- Suggest appropriate labels for this issue -->

- Priority: `priority: high` / `priority: medium` / `priority: low`
- Component: `component: chat` / `component: file-explorer` / `component: git`
- Type: `performance: cpu` / `performance: memory` / `performance: io`

## 📚 Additional Context

### Research
<!-- Any research done on this performance issue -->

### References
<!-- Links to relevant performance resources -->

- [Performance Guide](url)
- [Rust Performance Book](https://nnethercote.github.io/perf-book/)

### Monitoring
<!-- How to monitor this performance issue ongoing -->

---

**Thank you for reporting this performance issue!** Performance is crucial for a great user experience.