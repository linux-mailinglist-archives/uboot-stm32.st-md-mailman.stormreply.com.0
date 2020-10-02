Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963A2812E2
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 14:37:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18FDEC3FAFF;
	Fri,  2 Oct 2020 12:37:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B6FBC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 12:37:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092Cb7vC022529; Fri, 2 Oct 2020 14:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=zZ5tRMo2cgcnLjx7Qaeoi53drLQNw2Qcu6mmCU09sdQ=;
 b=MpKVg1uyiEe0yndzyJzGgEqfTx//ZMnq3Q0bIdAOYm0KcKlZCu3470DfSoN1tQ4O5Esu
 ePqkplDwyIrod9KnxaEcv92qKKkzWtzjV9iNf76RnHWBrbXMrKCq/n9egNIV9tOVsf5z
 yBm1nKlcJ41N94A+5yRAriC1zNZYt3y/8Ru0L3kwZ2KleUrsWt0SwhxdMDRbZldvid0q
 XVrVtNhMOOrJXek9P+kpI0tHS01tt91U/Zl07TISFn0gMwjgUTJGsD+AKqo67wQW2Fev
 IPT3PcMSCW8N01d+PLtk+TboZjbLoMYAXEpfe5U9mDwXOqSIrhGHEX9HCbRCz+ej7ybD Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf39ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 14:37:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FE2310002A;
 Fri,  2 Oct 2020 14:37:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 546AC2AE6C9;
 Fri,  2 Oct 2020 14:37:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 14:36:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 14:36:43 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 for v2020.10=
 u-boot-stm32-20201002
Thread-Index: AQHWmLiumHle4fgzNE6bRBG2uSuUxA==
Date: Fri, 2 Oct 2020 12:36:43 +0000
Message-ID: <1601642200954.8140@st.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 for v2020.10=
	u-boot-stm32-20201002
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

Hi Tom,

Please pull the STM32 related patches for v2020.10:  u-boot-stm32-20201002

With the last fixup:
- Fixup SPI-NOR boot on AV96 board

CI status:
    https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4878

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20201002

The following changes since commit 4f48163201f991de6d4a31b1c98a79e19971f57f:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-marvell (2020-10-01 08:55:20 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20201002

for you to fetch changes up to d9839417cb408415a240a5c513365973b3cb6031:

  ARM: dts: stm32: Add missing dm-spl props for SPI NOR on AV96 (2020-10-02 14:18:00 +0200)

----------------------------------------------------------------
- Fixup SPI-NOR boot on AV96 board

----------------------------------------------------------------
Marek Vasut (1):
      ARM: dts: stm32: Add missing dm-spl props for SPI NOR on AV96

 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)


Patrick Delaunay (1):
      arm: stm32mp: cleanup test on eth_env_set_enetaddr result

 arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi | 2 ++
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi           | 4 ++--
 arch/arm/mach-stm32mp/cpu.c                          | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
