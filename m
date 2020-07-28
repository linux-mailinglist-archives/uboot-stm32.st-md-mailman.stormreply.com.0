Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE03B230701
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9E84C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7A0C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9ni0V000712; Tue, 28 Jul 2020 11:51:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vCqftz6I0T6Csbsfv+YaMtjWucy8wtUOXvidMkDr2wc=;
 b=tUgTljtOhROZ9WBM0P/f3ER0ncGBe3mdtqDhUpAm7oF48+JQj7WFSfp8LgcFWxIlgKNW
 B3J1+MibtfTjLXSE0cEKK9eKmpjVokuFlVw96631kllnDPebeIxkOoR0qO9Lu4ykDJ14
 VqXwi3VL4xVHtH/l08dKS84C+VU9MqIKrHtFnecj4xsibxB3EBOPBL83QXFVw0hVR0z5
 T1mhrcFbKNzSaOQiGQGv2eICE5MV5+tWy8bn75kGIxS2yzUfDNOMY3sRT03z3mz9u+1o
 XghMDmUHONHGLv8areGc3o91xlWTToNL/7jrao+5co8Y56ksRXEViMHu6pxhtTv4j8Kz Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv5hs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1143110002A;
 Tue, 28 Jul 2020 11:51:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E12922A70DA;
 Tue, 28 Jul 2020 11:51:34 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:34 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:13 +0200
Message-ID: <20200728095128.2363-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: Joel Johnson <mrjoel@lixil.net>, Stephen Warren <swarren@nvidia.com>,
 Wolfgang Denk <wd@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 00/14] env: ext4: corrections and add test
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

V4 of the serie [1]: rebase on master branch and solve the SPL size
issue for board with SPL_ENV_IS_NOWHERE=y (pointed by Tom Rini in [2])

The buildman result for these boards are:

-------------------------------------------------
tools/buildman/buildman  -b sssddsqqs T1042RDB_PI_NAND_SECURE_BOOT
am335x_guardian am335x_guardian am335x_evm j721e_evm_r5
ls1021atwr_sdcard_ifc_SECURE_BOOT ls1043ardb_nand_SECURE_BOOT
ls1043ardb_sdcard_SECURE_BOOT ls1046ardb_qspi_spl
ls1088ardb_sdcard_qspi_SECURE_BOOT T1042RDB_PI_NAND_SECURE_BOOT -sS

Summary of 25 commits for 13 boards (12 threads, 1 job per thread)
01: Merge https://gitlab.denx.de/u-boot/custodians/u-boot-spi
   aarch64:  w+   ls1043ardb_sdcard_SECURE_BOOT ls1046ardb_sdcard_SECURE_BOOT ls1088ardb_sdcard_qspi_SECURE_BOOT
       arm:  w+   am335x_guardian j721e_evm_r5 ls1021atwr_sdcard_ifc_SECURE_BOOT
   powerpc:  w+   T1042RDB_PI_NAND_SECURE_BOOT
02: env: mmc: allow support of mmc_get_env_dev with OF_CONTROL
       arm: (for 7/7 boards) all +4534.9 bss -4.6 data +4537.1 text +2.3
03: env: mmc: correct the offset returned by mmc_offset_try_partition
       arm: (for 7/7 boards) bss +1.1 text -1.1
04: env: mmc: add redundancy support in mmc_offset_try_partition
05: stm32mp1: board: add support of CONFIG_ENV_IS_IN_MMC
06: stm32mp1: use a specific SD/eMMC partition for U-Boot enviromnent
07: configs:stm32mp1: activate env config in SPL
   aarch64: (for 5/5 boards) all -1.8 rodata -1.8
       arm: (for 7/7 boards) all +0.9 bss +3.4 rodata -2.6
08: cmd: env: add option for quiet output on env info
   aarch64: (for 5/5 boards) all +1.8 rodata +1.8
       arm: (for 7/7 boards) all -0.9 bss -3.4 rodata +2.6
09: cmd: env: check real location for env info command
10: configs: sandbox: Enable sub command 'env info'
11: test: env: add test for env info sub-command
12: env: add absolute path at CONFIG_ENV_EXT4_FILE
13: env: ext4: set gd->env_valid
14: env: sf: avoid space in backend name
   aarch64: (for 5/5 boards) all -0.2 rodata -0.2
15: env: correctly handle env_load_prio
   aarch64: (for 5/5 boards) all -8.0 spl/u-boot-spl:all -1.6 spl/u-boot-spl:text -1.6 text -8.0
       arm: (for 7/7 boards) all -2.3 bss +3.4 spl/u-boot-spl:all -1.7 spl/u-boot-spl:text -1.7 text -5.7
16: env: nowhere: add .load ops
17: env: the ops driver load becomes mandatory in struct env_driver
18: cmd: env: add env load command
19: cmd: env: add env select command
20: configs: sandbox: activate env in ext4 support
21: configs: sandbox: activate command env select and env load
22: test: environment in ext4
23: env: ext4: introduce new function env_ext4_save_buffer
24: env: ext4: add support of command env erase
25: test: sandbox: add test for erase command
-------------------------------------------------

In this serie, I add sandbox test with CONFIG_ENV_IS_NOWHERE
activated with EXT4 location: load, save and erase.

To test this feature, I add 2 new commands to change the
ENV location:
- env select [target]
- env load

To be able to test invalid file (bad CRC), I also add the support of
the command "env erase" for EXT4 env location.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=185725
[2] http://patchwork.ozlabs.org/project/uboot/patch/20200625075958.9868-6-patrick.delaunay@st.com/

Regards

Patrick


Changes in v4:
- don't use env_import in SPL to avoid to increase its size
  as it is only required for 'env load' command

Changes in v3:
- new
- new
- new: add load ops in nowhere
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
 env/nowhere.c                      |  17 +++++
 env/sf.c                           |   2 +-
 include/env.h                      |  15 +++-
 include/env_internal.h             |   3 +-
 test/py/tests/test_env.py          | 113 ++++++++++++++++++++++++++++-
 15 files changed, 349 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
