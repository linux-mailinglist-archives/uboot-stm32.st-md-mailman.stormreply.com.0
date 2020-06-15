Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C031F9982
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 16:02:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E57EC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 14:02:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A181C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 14:02:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FDtnYW023236; Mon, 15 Jun 2020 16:01:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=btzas74Eq0DdsuLRrQ7StZJr3DqjkC9+NGKymTBHIpA=;
 b=d85DRV5E9mfMZxYMOFW9Ng/hjL7CvjCcB1OM9IvKs/eUKD5atoay5iv6mDyGH0XnAGVC
 wEnTEY+nvevhLq0dGZF/RSuPW2c+D4hJNPdDKV5Msrc3JF1pgmPPyKALWesv+tWiWWSO
 UCtlEoHByO4kJfAysRWa0zPQvEOA7VzJgeQN/7ius2hSX8F4axgEqNdSeS7I/a0uiOw3
 Arl9VEJofKnNjz76XfwuIiggFKFOwR/rhNpuvXSif+eMaeBPfeSZ1znwP78Vi+R+D2Xu
 zqGnXrgQ72hg52kNICxLb83QViVuKG2PxifQY8JY3zV86B9RhkIgJHS4DNZzC0fxGsGl 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91j1xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:01:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 788DD100039;
 Mon, 15 Jun 2020 16:01:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32358206055;
 Mon, 15 Jun 2020 16:01:40 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 16:01:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 16:01:33 +0200
Message-ID: <20200615140137.21186-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Stephen Warren <swarren@nvidia.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Sam Protsenko <joe.skb7@gmail.com>,
 Simon Glass <sjg@chromium.org>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v4 0/4] cmd: env: add option for quiet output
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

It is a V4 for [1] serie.

I add the -q option for 'env info' command and I also add pytest
for this command.

Test for ENV_IS_IN_DEVICE is included in separate serie [2]
(I will activate ENV_IS_IN_EXT4 support in sandbox)

To avoid compilation warning, I add prototype for
env_get_location for the patch 3/7
"cmd: env: check real location for env info command"
as it is done in [3].

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=158105
[2] http://patchwork.ozlabs.org/project/uboot/list/?series=158160
[3] http://patchwork.ozlabs.org/patch/1230200/


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

Patrick Delaunay (4):
  cmd: env: add option for quiet output on env info
  cmd: env: check real location for env info command
  configs: sandbox: Enable sub command 'env info'
  test: env: add test for env info sub-command

 cmd/Kconfig                        |  1 +
 cmd/nvedit.c                       | 37 +++++++++++++++++++------
 configs/sandbox64_defconfig        |  1 +
 configs/sandbox_defconfig          |  1 +
 configs/sandbox_flattree_defconfig |  1 +
 configs/sandbox_spl_defconfig      |  1 +
 include/env_internal.h             | 11 ++++++++
 test/py/tests/test_env.py          | 44 ++++++++++++++++++++++++++++++
 8 files changed, 89 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
