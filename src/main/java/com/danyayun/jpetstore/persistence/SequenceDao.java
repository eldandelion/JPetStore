package com.danyayun.jpetstore.persistence;

import com.danyayun.jpetstore.domain.Sequence;

public interface SequenceDao {
    Sequence getSequence(Sequence sequence);

    void updateSequence(Sequence sequence);

}
