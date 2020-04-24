Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6ED1B7D2B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 19:42:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF55C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 17:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7B6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 17:42:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OHcSR1013269; Fri, 24 Apr 2020 19:42:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dFQRSbqvRbW/lyquDfjT2bLGxdybVytufZftn3lJk98=;
 b=McUDrSbPxakUY4ELTL3l9qkzaWmMShO7d0yp75J1zCj2N/8ysCvrG+S5/3NjXtJA5jBr
 +WtPB+XQGm5fjlhukmFker4LKZ/eN0892q1SyeJNMaSH4504PvLhVgMmWqnLjfqDHvwK
 jsqQrUAaIQC2QsKbcU3Bhw6yAYkExhdu2aB6FhflWuDTKaRbSBNUSJZV2wV02ih7YB9M
 lQVDAAaLBJwmSrOC21eX3WKVUYu1jZTSoTtn9PyP99gzIe+qgSG5Fme5IneMuux/qDpM
 8NV43fro4w5KVTfnhIOIoguI6+GfLjS0yyb/HWcU2wZ8EjEwq3XWvOWCMwKYOPgMslOo 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq124f05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 19:42:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A03210002A;
 Fri, 24 Apr 2020 19:42:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E68B2D1DAD;
 Fri, 24 Apr 2020 19:42:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Apr
 2020 19:42:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Apr 2020 19:42:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm/master =u-boot-stm32-20200424
Thread-Index: AQHWGkfUSAbYv8mEOEahFOoe0izkkw==
Date: Fri, 24 Apr 2020 17:42:06 +0000
Message-ID: <1587750125350.94861@st.com>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
In-Reply-To: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200424
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

Please pull the STM32 related fixes for v2020.07 = u-boot-stm32-20200424

With the following changes:
- Solve stm32mp15 pinctrl dts issue (patch conlict in branches master and next)
- Split device tree for DHCOR Som and AV 96 board
- Update PLL4 setting in AV96 board
- Enable bootd, iminfo, imxtract on DHCOM

CI status: 
    https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2909

Thanks,
Patrick

The following changes since commit dbfd9e0e61ff1f9c65703959ed8e3ceb410d1e7e:

  dm: pinctrl: Use right device pointer for configuring pinctrl (2020-04-23 08:25:37 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200424

for you to fetch changes up to 23d203d62e0ec95bc42bf96c56df991ff924f360:

  ARM: stm32: Enable bootd, iminfo, imxtract on DHCOM (2020-04-24 17:59:48 +0200)

----------------------------------------------------------------
- Solve stm32mp15 pinctrl dts issue (patch conflict in branches master and next)
- Split device tree for DHCOR Som and AV 96 board
- Update PLL4 setting in AV96 board
- Enable bootd, iminfo, imxtract on DHCOM

----------------------------------------------------------------
Marek Vasut (3):
      ARM: dts: stm32: Adjust PLL4 settings on AV96
      ARM: dts: stm32: Split AV96 into DHCOR SoM and AV96 board
      ARM: stm32: Enable bootd, iminfo, imxtract on DHCOM

Patrick Delaunay (1):
      ARM: dts: stm32mp1: remove file stm32mp157-pinctrl.dtsi

 arch/arm/dts/Makefile                                                             |    3 +-
 arch/arm/dts/stm32mp15-pinctrl.dtsi                                               |   96 ++++++++
 arch/arm/dts/stm32mp157-pinctrl.dtsi                                              | 1153 -------------------------------------------------------------------------------------------
 arch/arm/dts/stm32mp157a-avenger96.dts                                            |  423 +---------------------------------
 arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi                              |   83 +++++++
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts                                      |  212 +++++++++++++++++
 arch/arm/dts/{stm32mp157a-avenger96-u-boot.dtsi => stm32mp15xx-dhcor-u-boot.dtsi} |   86 +------
 arch/arm/dts/stm32mp15xx-dhcor.dtsi                                               |  232 +++++++++++++++++++
 configs/stm32mp15_dhcom_basic_defconfig                                           |    3 -
 doc/board/st/stm32mp1.rst                                                         |    8 +-
 10 files changed, 638 insertions(+), 1661 deletions(-)
 delete mode 100644 arch/arm/dts/stm32mp157-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
 rename arch/arm/dts/{stm32mp157a-avenger96-u-boot.dtsi => stm32mp15xx-dhcor-u-boot.dtsi} (71%)
 create mode 100644 arch/arm/dts/stm32mp15xx-dhcor.dtsi


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
