Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EA7158061
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 18:01:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D429C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 17:01:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D82A3C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:01:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGvl88015419; Mon, 10 Feb 2020 18:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=swswujX9B7hzGlxIyDSM1C2cD2T+9tZVHmBx/bbuF50=;
 b=zGI95wNdMiZhdxJmDEAAWhtgKNXqHdksyvAPA6tGQCp3G9z0armxZpCaw5qdBWdA3VBA
 hwvAlLp0bydwvAov3WL+7QLvCOjEW4mqpUBO9TYm0VP/R+6Yx952EBbCPLLMosAuJ6Qi
 ZIUUU241FUjhQrLeTXLXyFa0DdFWKyScTXhMz1o6ArY5UH3NKn/opt3gBCKPAwLW0ioW
 1ytnSZw2s0oa3lAQ9HlTmg9ta8c3wE5DmOomQNicBF0HRXfzobwCocr/hyoibynGuzxL
 IIp/9zRZ2cTT2qsGwoVNUQdGP+y+/2CHrTekIOIETNE/EFI+I6kieTqTZVw0njrX8iSS Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufgv1x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 18:01:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50A6A10002A;
 Mon, 10 Feb 2020 18:01:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31B8D2A7C1B;
 Mon, 10 Feb 2020 18:01:32 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Feb 2020 18:01:31 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Feb 2020 18:01:22 +0100
Message-ID: <20200210170129.8405-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Stephen Warren <swarren@nvidia.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Sam Protsenko <joe.skb7@gmail.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v2 0/7] cmd: env: add option for quiet output
	on env info
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

It is a V2 after Wolfgang and Simon remarks for
"cmd: env: add option for quiet output on env info"
http://patchwork.ozlabs.org/project/uboot/list/?series=155122

I also add pytest for command env info.

Test for ENV_IS_IN_DEVICE will be include in future serie
(I will activate ENV_IS_IN_EXT4 support in sandbox)

To avoid compilation warning, I add prototype for
env_get_location for the patch 3/7
"cmd: env: check real location for env info command"
as it is done in
http://patchwork.ozlabs.org/patch/1230200/

Regards

Patrick


Changes in v2:
- update prototype in env_internal.h  as done in
  "env: add prototypes for weak function"
- remove comment change in env.c (implementation information)
- move env_location declaration
- activate CMD_NVEDIT_INFO in sandbox (new patch)
- activate env info command in sandbox (new)
- add pytest test_env_info and test_env_info_test (new)

Patrick Delaunay (7):
  cmd: env: add option for quiet output on env info
  cmd: env: use ENV_IS_IN_DEVICE in env info
  cmd: env: check real location for env info command
  stm32mp1: use the command env info in env_check
  stm32mp1: configs: activate CMD_ERASEENV
  configs: sandbox: Enable sub command 'env info'
  test: env: add test for env info sub-command

 arch/arm/mach-stm32mp/Kconfig       |  1 +
 cmd/Kconfig                         |  1 +
 cmd/nvedit.c                        | 39 +++++++++++++++++++------
 configs/sandbox64_defconfig         |  1 +
 configs/sandbox_defconfig           |  1 +
 configs/sandbox_flattree_defconfig  |  1 +
 configs/sandbox_spl_defconfig       |  1 +
 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_optee_defconfig   |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 include/configs/stm32mp1.h          |  4 +--
 include/env_internal.h              | 11 ++++++++
 test/py/tests/test_env.py           | 44 +++++++++++++++++++++++++++++
 13 files changed, 95 insertions(+), 12 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
