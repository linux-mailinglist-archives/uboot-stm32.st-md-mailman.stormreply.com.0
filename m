Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA81FAA27
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC4A3C36B14
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A540C36B11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e33E007394; Tue, 16 Jun 2020 09:40:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BKS1kdNHbcQulD9mF8+cgUq+Pw+FgOI3iiFVZtTLAqo=;
 b=apcXCLgkQIFdGEpfg74jk532jgJcmNE67x9Z/IgaG6NNJebYmpiNUPfyuY8synjqJtKV
 2ZQUTasFHYq4uc38jPsQzGYFzU13jW7zMWhVi8SC5MoxgYUxdZLyWJ1vKUwL1h3k4K7M
 7rYg4vUYeewwDHL6//TjyJ/N28RpAcCa9zHn+Mb63V3heQyiptMXy9YRX2LA4ez/2LlU
 C52/mHM9r0ffJl3DZXrBM7iFyeG+3ma3B9du8cby4MUi9n7P0c2qncfDm2kuIPCn6dge
 EYvhQtu2axWEP+obohNyDR7tTTR5hTDDJwohNv2OR7YWnbfIBRh+2WyEuVwqrOntwWPx ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx95x20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADCDF10002A;
 Tue, 16 Jun 2020 09:40:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CDCD2AEF8D;
 Tue, 16 Jun 2020 09:40:50 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:50 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:39 +0200
Message-ID: <20200616074048.7898-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Wolfgang Denk <wd@denx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 0/9] env: ext4: corrections and add test
	for env in ext4
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


Hi,

V2 is only a rebase and adaptation of the serie [1].

In this serie, I add sandbox test with CONFIG_ENV_IS_NOWHERE
activated with other location: at least one CONFIG_ENV_IS_IN_...
is defined and  ENV_IS_IN_DEVICE is automatically defined.

To test this feature, I activate and test ENV_IS_IN_EXT4
in sandbox; I add a new command "env_loc" to change this
ENV location.

This serie depends on previous env test introduced in [2]
"cmd: env: add option for quiet output on env info"

To be able to test invalid file (bad CRC), I also add the support of
the command "env erase" for EXT4 env location.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=158160
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=183438

Regards

Patrick


Changes in v2:
- change cmd_tbl_t to struct cmd_tbl
- use CONFIG_IS_ENABLED to set .erase (same as .save)

Patrick Delaunay (9):
  env: add absolute path at CONFIG_ENV_EXT4_FILE
  env: ext4: set gd->env_valid
  env: correctly handle result in env_init
  sandbox: activate env in ext4 support
  sandbox: support the change of env location
  test: environment in ext4
  env: ext4: introduce new function env_ext4_save_buffer
  env: ext4: add support of command env erase
  test: sandbox: add test for erase command

 board/sandbox/sandbox.c            |  52 +++++++++++++++
 configs/sandbox64_defconfig        |   5 ++
 configs/sandbox_defconfig          |   5 ++
 configs/sandbox_flattree_defconfig |   5 ++
 configs/sandbox_spl_defconfig      |   5 ++
 env/Kconfig                        |   2 +-
 env/env.c                          |   5 +-
 env/ext4.c                         |  54 ++++++++++++---
 test/py/tests/test_env.py          | 103 +++++++++++++++++++++++++++++
 9 files changed, 226 insertions(+), 10 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
