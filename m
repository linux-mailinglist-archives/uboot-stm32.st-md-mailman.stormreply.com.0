Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE6263065
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 17:20:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29383C3FAE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:20:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12E5BC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 15:20:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089FCcE0022183; Wed, 9 Sep 2020 17:20:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=kTCNOt2AjRxTwMR8hVa4WVV7taVCd3MIndTSGcS3XjE=;
 b=e1hjQIulddL8J7KESYtHRxkyCnU4OziKNlaQeYjJiaNfA0GdedmVdCTirv6W5oM+jczj
 4ujcYJzMI7fSzAoGeaqS3iYMP9Ewxlw/ZJCFaG2Rty6uU2jPn0w9LfdUOTy2rfe6O/AK
 y/FEl324V0cNlhysk/0C1MsEDG5B895JK+YNnvKt6Mcqn2fN5qv8+i4LcZloMLL2kTLQ
 fwp2wC9MR9kNrnFAc1Fe57RgIeYHGBqjCOZNrfck+xCKJCWtM/Z56Vzt19noY1rZNCIm
 v8IVTDnk453NrCWOOCU74Rb5l8oY09j6cjsPGqIRFJYSC+szgYh3bfRCeNVfQYMGc3M0 XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0euwv7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 17:20:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78B3110002A;
 Wed,  9 Sep 2020 17:20:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C0212BA2DC;
 Wed,  9 Sep 2020 17:20:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 17:20:27 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 9 Sep 2020 17:20:27 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 for v2020.10=
 u-boot-stm32-20200909
Thread-Index: AdaGrW6pM8DZ5TbWQ2uXxRbKmkq61A==
Date: Wed, 9 Sep 2020 15:20:27 +0000
Message-ID: <83458f7b5f104d0f94f243f10f0d7060@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_09:2020-09-09,
 2020-09-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 for v2020.10=
 u-boot-stm32-20200909
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

Please pull the STM32 related patches for v2020.10:  u-boot-stm32-20200528

With the following changes:
- fixes on AV96 board: pull up on UART4 RX and adjust PLL4

CI status:
    https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4631

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20200909

The following changes since commit 96d66a9b8ce11aae9f8bef5244b83b4740b37644:

  Prepare v2020.10-rc4 (2020-09-07 14:17:33 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200909

for you to fetch changes up to b6055945d66d0f4e3b1ecb82af476232067a4ee4:

  ARM: dts: stm32: Adjust PLL4 settings on AV96 again (2020-09-09 15:02:23 +0200)

----------------------------------------------------------------
- fixes on AV96 board: pull up on UART4 RX and adjust PLL4

----------------------------------------------------------------
Marek Vasut (2):
      ARM: dts: stm32: Pull UART4 RX high on AV96
      ARM: dts: stm32: Adjust PLL4 settings on AV96 again

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
