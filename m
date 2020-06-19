Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B505E200839
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:56:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E3F6C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:56:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69D3CC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:56:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBuYNl009355; Fri, 19 Jun 2020 13:56:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1LqFKFOgRJHfdHvUV0lH1f9tKLUzj7ZyhmNnPPVyDDY=;
 b=EoCNYFDnFZbOCZ8ZTly0uBAPeV71aW3hA18Tgkq6EXYC6eCBYeXNqmzehHFNwjOojnLm
 kwshuG/H/nG3d9Rnf/Mz1AWVMfv2smZ2/NS6rkthL1f70Sqz0+HLd9+W9EIQrBwyU6VR
 8vxjYJxhfb99hyvtGje29egwUR/8dPlBEnU5KlpgyCtID2DVnJXIvDvCxFIkbT1MHu3f
 22wPXe6ZB56jemuwb1KC8OzlbIimyX+euMIyTz5vdX/D6MEUslH/QZ9dV2dd/t1TZcVL
 0XjuG2LLWhC4T8ehqHbb1a36SEnFnu7gcTpgltFAFixJuoohxiemRMXbSWsJ97kAQ7nM iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64arkeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:56:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59E6310002A;
 Fri, 19 Jun 2020 13:56:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32CE92BF9CC;
 Fri, 19 Jun 2020 13:56:20 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 13:56:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 13:56:06 +0200
Message-ID: <20200619115611.16375-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, Frank Wunderlich <frank-w@public-files.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Stephen Warren <swarren@nvidia.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Sam Protsenko <joe.skb7@gmail.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v5 0/5] cmd: env: add option for quiet output
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

It is a V5 for [1] serie.

I add the -q option for 'env info' command and I also add pytest
for this command.

Test for ENV_IS_IN_DEVICE is included in separate serie [2]
(I will activate ENV_IS_IN_EXT4 support in sandbox)

To avoid compilation warning, I add prototype for
env_get_location for the patch 3/7
"cmd: env: check real location for env info command"
as it is done in [3].

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=183438
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=158160
[3] http://patchwork.ozlabs.org/patch/1230200/


Changes in v5:
- allow to execute cmd_nvedit_info on real board
- rename test_env_info_quiet to test_env_info_sandbox

Changes in v4:
- rebase on master branch
- move 5/7 stm32mp1: configs: activate CMD_ERASEENV
  in a new serie 183380
- move 2/7 and 4/7 in a new serie 183387

Changes in v3:
- update commit message (sub-commandi)
- rename test_env_info_test to test_env_info_quiet

Changes in v2:
- update prototype in env_internal.h  as done in
  "env: add prototypes for weak function"
- remove comment change in env.c (implementation information)
- move env_location declaration
- activate env info command in sandbox (new)
- add pytest test_env_info and test_env_info_test (new)

Patrick Delaunay (5):
  stm32mp1: use the command env info in env_check
  cmd: env: add option for quiet output on env info
  cmd: env: check real location for env info command
  configs: sandbox: Enable sub command 'env info'
  test: env: add test for env info sub-command

 arch/arm/mach-stm32mp/Kconfig      |  1 +
 cmd/Kconfig                        |  1 +
 cmd/nvedit.c                       | 37 ++++++++++++++----
 configs/sandbox64_defconfig        |  1 +
 configs/sandbox_defconfig          |  1 +
 configs/sandbox_flattree_defconfig |  1 +
 configs/sandbox_spl_defconfig      |  1 +
 include/configs/stm32mp1.h         |  4 +-
 include/env_internal.h             | 11 ++++++
 test/py/tests/test_env.py          | 63 ++++++++++++++++++++++++++++++
 10 files changed, 110 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
