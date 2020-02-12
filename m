Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1A15AFD9
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:31:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FBA3C36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:31:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77F92C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:31:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIEEBF031223; Wed, 12 Feb 2020 19:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BwykBCHdeoy0KykWOPg5FQRitDtb5C8O15ibpsAqNd4=;
 b=gRP4K6deNeZDh5aXmZrIj0Otpa55TyIcC9LhH1uvHPYFH6Deyh/lQBGsEn1QqQmvEZVK
 n4xGwUKj24HcdjpVU6EvJKCLjpwmn5vol8KzOIK037Y0Pewp6KncTK1AH2fbyfTfKOpv
 /QlkQUUdQaF/B7sXv60GSG0YmoFjMHeA/eeY+exsOmBVkRk+ovYrEwHVM0F5gkZR7mGJ
 PiW03u8tKxfbB9eYV9yYgdvP6clWsPlETIg8z5KCyjAtgbYvngn00JTU8QURExoF0mGi
 uVklAVBR7LIzbvnbZeWPT1KgMVMTxTq3Ipjh7Kj7O0J8UeW9gPGrRrHlQIZr+Y0xT1NT ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqst5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B376100034;
 Wed, 12 Feb 2020 19:30:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B9CF2C38D7;
 Wed, 12 Feb 2020 19:30:25 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:24 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:11 +0100
Message-ID: <20200212183021.4844-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Wolfgang Denk <wd@denx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 00/10]
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

env: ext4: add test for env in ext4

Hi,

In this serie, I add sandbox test with CONFIG_ENV_IS_NOWHERE
activated with other location: at least one CONFIG_ENV_IS_IN_...
is defined and  ENV_IS_IN_DEVICE is automatically defined.

To test this feature, I activate and test ENV_IS_IN_EXT4
in sandbox; I add a new command "env_loc" to change this
ENV location.

This serie depends on previous env test introduced in:
"cmd: env: add option for quiet output on env info"
http://patchwork.ozlabs.org/project/uboot/list/?series=158105

To be able to test invalid file (bad CRC), I also add the support of
the command "env erase" for EXT4 env location.

Regards

Patrick



Patrick Delaunay (10):
  env: add absolute path at CONFIG_ENV_EXT4_FILE
  env: ext4: set gd->env_valid
  env: correctly handle result in env_init
  sandbox: activate env in ext4 support
  sandbox: support the change of env location
  test: environment in ext4
  env: ext4: fix possible compilation issue
  env: ext4: introduce new function env_ext4_save_buffer
  env: ext4: add support of command env erase
  test: sandbox: add test for erase command

 board/sandbox/sandbox.c            |  50 ++++++++++++++
 configs/sandbox64_defconfig        |   5 ++
 configs/sandbox_defconfig          |   5 ++
 configs/sandbox_flattree_defconfig |   5 ++
 configs/sandbox_spl_defconfig      |   5 ++
 env/Kconfig                        |   2 +-
 env/env.c                          |   5 +-
 env/ext4.c                         |  63 +++++++++++++++---
 test/py/tests/test_env.py          | 103 +++++++++++++++++++++++++++++
 9 files changed, 232 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
