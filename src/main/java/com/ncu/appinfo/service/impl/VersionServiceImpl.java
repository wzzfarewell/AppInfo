package com.ncu.appinfo.service.impl;

import com.ncu.appinfo.dao.VersionMapper;
import com.ncu.appinfo.entity.Version;
import com.ncu.appinfo.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VersionServiceImpl implements VersionService {

    @Autowired
    private VersionMapper versionMapper;

    @Override
    public Version selectVersion(Long id) {
        return versionMapper.selectByPrimaryKey(id);
    }
}
