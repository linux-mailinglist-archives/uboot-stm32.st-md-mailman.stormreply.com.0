Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFD2CD24E
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:16:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE872C56636;
	Thu,  3 Dec 2020 09:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE7A6C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:16:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B397hqs005959; Thu, 3 Dec 2020 10:16:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eN36aZNl8CVWOVhpGK4dtuGTPU2CT+diYADmlFv19vI=;
 b=TILL4k2TX8ffyg1etdmyFuBgJK5izJydoUu+Qj7G/iW3aXcAZWFsiA8jXLqGQvTN/tb3
 8m35FQMvYgFnxZKlpZsFBVAQ20Syjqnhcjnsdzaruf+yvP7cfnidZD8/z8xR8N4ZDO/Y
 ei+miooesuot7VMUI2D/0xubZDx1hRHg9c4eTSUS23Ri3gzt98WLNQX/kTm15Z3mpBUC
 iSAwI3NMoiZyCqoOKVcdAf8cN/Xm+/RhHidqbEJcUONytfl3q3ekMP6vcgcnfgYuWVW+
 1GAAX3EZEr63tYMvm43xkmYErmlm73XdmM2nvZnhp9o0Va8NgpWv96F6v42AWEqEADkp fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hfpks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:16:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E77E2100034;
 Thu,  3 Dec 2020 10:16:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D18EB233FDA;
 Thu,  3 Dec 2020 10:16:06 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:16:06
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:15:43 +0100
Message-ID: <20201203091549.7031-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
Cc: Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Soeren Moch <smoch@web.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD and
	VIDCONSOLE_AS_NAME
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


I propose this serie to remove the vidconsole work-around, activated with
the 2 options VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME and cleanup
the associated code in console.c (under #ifdef CONFIG_VIDCONSOLE_AS_LCD)

This options are now obsolete and they was planned to be
removed around the end of 2020.

I propose this patchset for v2021.04 even if I don't
test this serie on real boards.

Patrick.



Patrick Delaunay (6):
  tbs2910: configs: remove VIDCONSOLE_AS_LCD
  peach-pit: configs: remove VIDCONSOLE_AS_LCD
  snow: configs: remove VIDCONSOLE_AS_LCD
  peach-pi: configs: remove VIDCONSOLE_AS_LCD
  spring: configs: remove VIDCONSOLE_AS_LCD
  video: remove VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME

 common/console.c            | 10 ----------
 configs/peach-pi_defconfig  |  1 -
 configs/peach-pit_defconfig |  1 -
 configs/snow_defconfig      |  1 -
 configs/spring_defconfig    |  1 -
 configs/tbs2910_defconfig   |  1 -
 drivers/video/Kconfig       | 22 ----------------------
 7 files changed, 37 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
