Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0565448
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 12:03:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2C2ED1DEC6
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 10:03:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6358FD1DEC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 10:03:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6BA23ax006947; Thu, 11 Jul 2019 12:03:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=M/rQ4948BqP93m6LNX4wyT1UkTGvGsoTUfj6fxT0HJw=;
 b=rT5ElhDyRbYF+MN9a2eXRlqWgc7pgqoiqWdUX+vDj0RELVMOVn9TvN7e9JwbWeM3MjgS
 hjq15HLZM5U+nezaMbkJRO7JdSpPiebWb9/RConfChTjVAIFOVL09V9YCEs5/0AbbkDM
 PhG6bkDYSsR0tezSmUK1ajGvufVJT8ggJEChuZDpRGK/jG/cYawHW8huOhOHCvAk1Pn/
 rmsot1BQhZHvbZPIfvararrjfP9yl72BJGwtkbdLlFokgmv0E9Yxiey7+9Uf/NTYY3U1
 UIX2TQuDzp2a2S0sxX8TMEysgKIRvCwbwsVUfjOzkO6Gy4IoS5Gg6OklrIGSYhsXYHlF OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51gppj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 12:03:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3996742;
 Thu, 11 Jul 2019 10:03:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AB1414EF;
 Thu, 11 Jul 2019 10:03:43 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 11 Jul
 2019 12:03:43 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 11 Jul 2019 12:03:43
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <patrick.delaunay@st.com>, <patrice.chotard@st.com>, <sjg@chromium.org>
Date: Thu, 11 Jul 2019 12:03:36 +0200
Message-ID: <20190711100338.1327-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 0/2] Add RTC driver for STM32MP1
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

This series add support of RTC driver for stm32mp1 SoC.
First it adds the missing clocks for RTC hadrware block and after
the driver itself (enabled for basic and trusted configurations).

version 3:
- release clock only on error cases.

Benjamin Gaignard (1):
  rtc: Add rtc driver for stm32mp1

Patrick Delaunay (1):
  clk: stm32mp1: Add RTC clock entry

 configs/stm32mp15_basic_defconfig   |   2 +
 configs/stm32mp15_trusted_defconfig |   2 +
 drivers/clk/clk_stm32mp1.c          |   9 +
 drivers/rtc/Kconfig                 |   6 +
 drivers/rtc/Makefile                |   1 +
 drivers/rtc/stm32_rtc.c             | 323 ++++++++++++++++++++++++++++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 drivers/rtc/stm32_rtc.c

-- 
2.15.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
