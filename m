Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D19175A6D
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 13:25:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6A76C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 12:25:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9328C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 12:25:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022CDgUI008353; Mon, 2 Mar 2020 13:24:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=kNptDNW9N9kXoXcAOevxgyvazdNrMNUxb6ChOfujGhU=;
 b=FdslSOllGGN7eF9/ja2UJ4JV3GILndNBmknEufaduwhIgQc//cOiC61EU3rJjGHwsuZi
 OurkT0xNwFHoyp1eYPnRNWa3VkxCyUSsGiTjUNhCvO8bgNwydC4xBZuT+XS8fSYC5dMp
 3w3gMwqLhbpjT92mGY2fbHTGpAK1dHN+o2+qPvndx22llMQSgkk3qG1nqv7bVu6hoSAH
 V8Wn9q+jRadimg1IU87ls2u/AWeJvizeKbBhJ3IoXwqaoLeKcMNIjqyah9dXlX4KIhjm
 gLgLPxQdiqyFlHPlw/vU1Rv5SK67IyDas3cdYr7cPZx1N5QEBEhFGUYu+Ys0ll/o3wrz OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem0kddf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 13:24:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B923C10003E;
 Mon,  2 Mar 2020 13:24:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9502C2474;
 Mon,  2 Mar 2020 13:24:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 13:24:51 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Mar 2020 13:24:51 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 = u-boot-stm32-20200203
Thread-Index: AdXwbh2AHrgvG3IPRPq+AbKTgAYiSQ==
Date: Mon, 2 Mar 2020 12:24:51 +0000
Message-ID: <e2201a558c034386a9c2397b956b590c@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-03-02,
 2020-03-02 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 =
	u-boot-stm32-20200203
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

Please pull the STM32 related patches for v2020.04-rc4 = u-boot-stm32-20200203 

With the following changes:
- convert stm32mp1 board documentation to rst format
- fix in stm32mp1 rng driver

CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2334

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20200203
The following changes since commit 9e1d65f36b83c5422ece3c0ea28d07a2246cb07f:

  configs: Resync with savedefconfig (2020-02-28 13:28:38 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200203

for you to fetch changes up to efa667d38bb8bdd548972e10d02d830d9256602d:

  doc: add board documentation for stm32mp1 (2020-03-02 09:41:32 +0100)

----------------------------------------------------------------
- convert stm32mp1 board documentation to rst format

----------------------------------------------------------------
Heinrich Schuchardt (1):
      stm32mp1: rng: remove superfluous assignment

Patrick Delaunay (1):
      doc: add board documentation for stm32mp1

 MAINTAINERS                |   1 +
 board/st/stm32mp1/README   | 520 +----------------------------------------------
 doc/board/index.rst        |   1 +
 doc/board/st/index.rst     |   9 +
 doc/board/st/stm32mp1.rst  | 611 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/rng/stm32mp1_rng.c |   2 +-
 6 files changed, 624 insertions(+), 520 deletions(-)
 create mode 100644 doc/board/st/index.rst
 create mode 100644 doc/board/st/stm32mp1.rst
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
