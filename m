Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D115A952
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 13:40:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90E6AC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 12:40:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C6F0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 12:40:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CCWdKh031605; Wed, 12 Feb 2020 13:40:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3wf3Db6wINRlwDpaMdyWbU7H6IiKbpX6A6+Pc9hh2bg=;
 b=aota/1/9kWnpNmBuGMNbqrE+2EIWJzzREBBoDfVV2CHxjp+XMg6k6izM3w7Oq8fcZ1ZW
 vWqCzNKy8SOld6zS9CwzlF9FvH4WZK+2L7I9SL8P8Ox+4tqeMiuoAVVvDF1q/0Na/2Fi
 kxnu7T5tWXKn1junNS7tzpbQ4ESFCqPc56WgiQtsX3KZoYB8oOy1ndl/X9Z6iQMgKa2P
 dvTrGRcnzo1YWwomK6QzeHAheiFdyJ3z9NoTZL8luN2kUk94oaB5oVCuMB8vWtUzkHM7
 hbwrsVbaUyh0FFxz1pZYlKRnNI97fgr7/pz84fMUgASEvqjLAILAwGHkrP988FimUHK5 yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhec88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 13:40:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB8F1100034;
 Wed, 12 Feb 2020 13:40:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A40B2B1867;
 Wed, 12 Feb 2020 13:40:03 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 13:40:03 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 13:39:53 +0100
Message-ID: <20200212124001.12788-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_06:2020-02-11,
 2020-02-12 signatures=0
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
Subject: [Uboot-stm32] [PATCH v3 0/7] cmd: env: add option for quiet output
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

It is a V3 for
"cmd: env: add option for quiet output on env info"
http://patchwork.ozlabs.org/project/uboot/list/?series=157728

I also add pytest for command env info.

Test for ENV_IS_IN_DEVICE will be included in future serie
(I will activate ENV_IS_IN_EXT4 support in sandbox)

To avoid compilation warning, I add prototype for
env_get_location for the patch 3/7
"cmd: env: check real location for env info command"
as it is done in
http://patchwork.ozlabs.org/patch/1230200/

Regards

Patrick

Changes in v3:
- udpate commit message (sub-commandi)
- rename test_env_info_test to test_env_info_quiet

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
