Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C87BF59C69
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:03:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91EB5C20B44
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:03:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1724C20B44
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:03:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SD1bj6013096; Fri, 28 Jun 2019 15:03:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HUzLxp2j6iU/o0je4jB9E9/AzO4AxD4Z3lZz7FprUW4=;
 b=Ybx4s5l9T8o5wvsxFAc3Bkq4kVvShsGrcNUJku2IrmRcbemVhdh+eVA8827V5nH0Cw81
 rRDmAyU1Jt1ZcgpUIcCKQiRA9XIeFo5gQohArMc3e53iWRT0jFm055QZZg9u6u/f4mKk
 cn0YBO4UPB7bWGvlxQxeJqmvelC/wl1XSbAcGOTK/UPGRMZB2DSE7rAzwapTzDs9cnfW
 es3JFlTAILVmWH2/BGoNmGCPD5Kf5EqCMgRCdiwLLjMfX+iCgjArse4oWQPW7HqEeFIN
 V+4P/6uxhp4d9x6bjt6DOuSgijDAchedFEWFwrE2GDvck5esYJB8WooxH13cdZuXhaHR tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gx0ms-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:03:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C998534;
 Fri, 28 Jun 2019 13:03:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA45F2933;
 Fri, 28 Jun 2019 13:03:12 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 15:03:12 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Jun 2019 15:02:57 +0200
Message-ID: <20190628130301.18094-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_05:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Rick Chen <rick@andestech.com>, Patrick Delaunay <Patrick.delaunay@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/4] Align QSPI compatible string with kernel
	one:
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


Initially, QSPI compatible string was first introduced in U-boot.
On kernel side a different one was used, so align U-boot with kernel.



Patrice Chotard (4):
  ARM: dts: stm32: Use kernel qspi compatible string for
    stm32f7-uboot.dtsi
  ARM: dts: stm32: Use kernel qspi compatible string for
    stm32f469-disco-uboot.dtsi
  spi: stm32_qspi: Remove "st,stm32-qspi" compatible string
  doc: device-tree-bindings: alignment with v5.2-rc6 for
    spi-stm32-qspi.txt

 arch/arm/dts/stm32f469-disco-u-boot.dtsi      |  2 +-
 arch/arm/dts/stm32f7-u-boot.dtsi              |  2 +-
 .../spi/spi-stm32-qspi.txt                    | 71 ++++++++++---------
 drivers/spi/stm32_qspi.c                      |  1 -
 4 files changed, 40 insertions(+), 36 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
