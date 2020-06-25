Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163E209AED
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEDECC36B20
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 331B1C36B11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7w0Bf027761; Thu, 25 Jun 2020 10:00:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fvGK1+53vnuAcPS7njvCcwTBDCU1MOdTX6UMM8RLmXM=;
 b=VPz4WR9tbb10aJ6/pjWMUhdlgtxiD9zOQGFKg+/hD+k8/YR7FQzFL5M1kKwndwyzo5ZE
 JrilxeNlwNBE4ExbpsoRRur7wSTMT20ZI35cQ4VHrnEJVBqqX675qBP8gGSlZP6hEjFW
 y4+DfN02IfhNWRvEvRx9g2GKHlfnLJubLplcr+u+F9IQN5pfulphkYKYENQwc3sc1IwY
 buwzJPAiuyDB2dlp3rV5DG0lsz4FrkA9+/e3iZgLG6Cvpk2bxce3TcU6NzNNGKWyHAc7
 P2frIAQZCpnZhNfVZmgBGAfTEv+ySE683E2zEmS50j7HIE3IwRYz81opV99s8ynIOHTR lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuus0psf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 638EA100034;
 Thu, 25 Jun 2020 10:00:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AF7C2A991B;
 Thu, 25 Jun 2020 10:00:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:21 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:44 +0200
Message-ID: <20200625075958.9868-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: Joel Johnson <mrjoel@lixil.net>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Stephen Warren <swarren@nvidia.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Sam Protsenko <joe.skb7@gmail.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v3 00/14] env: ext4: corrections and add test
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

V3 of the serie [1].

In this serie, I add sandbox test with CONFIG_ENV_IS_NOWHERE
activated with EXT4 location: load, save and erase.

To test this feature, I add 2 new commands to change the
ENV location:
- env select [target]
- env load

This serie depends on previous env test introduced in [2]
"cmd: env: add option for quiet output on env info"

To be able to test invalid file (bad CRC), I also add the support of
the command "env erase" for EXT4 env location.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=183620
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=184539

Regards

Patrick


Changes in v3:
- new
- new
- new: add ?load ops in nowhere
- new: load operation becomes mandatory
- new: add 'env load' command
- new: add 'env select' command
- change env_get_location to avoid gd->env_load_prio modification
- replace specific sandbox command by generic command
  'env select' and 'env load'
- change title "sandbox: support the change of env location"
- replace specific sandbox command by generic command
  'env select' and 'env load'
- update after Stephen Warren comments
- replace sandbox command by generic command 'env load' in test_env

Changes in v2:
- change cmd_tbl_t to struct cmd_tbl
- use CONFIG_IS_ENABLED to set .erase (same as .save)

Patrick Delaunay (14):
  env: add absolute path at CONFIG_ENV_EXT4_FILE
  env: ext4: set gd->env_valid
  env: sf: avoid space in backend name
  env: correctly handle env_load_prio
  env: nowhere: add .load ops
  env: the ops driver load becomes mandatory in struct env_driver
  cmd: env: add env load command
  cmd: env: add env select command
  configs: sandbox: activate env in ext4 support
  configs: sandbox: activate command env select and env load
  test: environment in ext4
  env: ext4: introduce new function env_ext4_save_buffer
  env: ext4: add support of command env erase
  test: sandbox: add test for erase command

 board/sandbox/sandbox.c            |  15 ++++
 cmd/Kconfig                        |  11 +++
 cmd/nvedit.c                       |  29 ++++++++
 configs/sandbox64_defconfig        |   7 ++
 configs/sandbox_defconfig          |   7 ++
 configs/sandbox_flattree_defconfig |   7 ++
 configs/sandbox_spl_defconfig      |   7 ++
 env/Kconfig                        |   2 +-
 env/env.c                          |  80 ++++++++++++++++++--
 env/ext4.c                         |  54 ++++++++++++--
 env/nowhere.c                      |   9 +++
 env/sf.c                           |   2 +-
 include/env.h                      |  15 +++-
 include/env_internal.h             |   3 +-
 test/py/tests/test_env.py          | 113 ++++++++++++++++++++++++++++-
 15 files changed, 341 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
