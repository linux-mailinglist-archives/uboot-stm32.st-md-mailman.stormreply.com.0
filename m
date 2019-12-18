Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C32124690
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 13:13:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 105CFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 12:13:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F8DCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 12:13:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBICCOSH024364; Wed, 18 Dec 2019 13:13:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=hod4W+53WH2bYOM/pWKiD/VPrrPAA+PhvqvJk1CATpU=;
 b=uh+VhDwi2G1UREnysBgHYyk3Vw3WFvzL9D5wVYUuFKCBNzjSqzVVuGvNcY84oQM4Ouin
 qW1ugYayCEwKFC968lnXwoEzSTn8YSwwO3cS2I4m0cqkQLGIcwrETBoNWqpZKS6NgbDD
 tfulbI5ulGjBD3jgpv/Ldsc6mwYILHQwIOVw3iWYKnylfJuCwYMit2IU6dSlQjZ3CWx1
 kXzUEpP6DcSHM+tPx7IIVNODwTK6mTLeOZ7fR4efh2df03C3cuIg+jKjSMvwYZ5o1XLq
 EUtWsEt9Ou1XciBiE4Dc79uMrSmR/msFF5mSYWx7eFimDz4/cYrd56xm8Ha8BEmfYDSw pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnremapx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 13:13:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7675F100034;
 Wed, 18 Dec 2019 13:13:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6830D2B1892;
 Wed, 18 Dec 2019 13:13:30 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 13:13:30 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 13:13:30 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 u-boot-stm32-20191218
Thread-Index: AdW1mgE0lh9h+1ntQqu7m/jP2uR6LQ==
Date: Wed, 18 Dec 2019 12:13:29 +0000
Message-ID: <38736df3b2ae4cf3b487e83cf5fae71c@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_03:2019-12-17,2019-12-18 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20191218
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

Hi Tom

Please pull the last STM32 related patches for v2020.01

Travis CI status:
     https://travis-ci.org/patrickdelaunay/u-boot/builds/626655770

With the following fixes:
- fix crash for stm32mp1: remove the BOOTSTAGE feature
- fix warning for stm32mp1: add the missing cls command

And I also resync the stm32mp1 defconfig.

Thanks,
Patrick

git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20191218
warn: No match for commit eddd79291d2026f8fefebc3f5d39928d7c649241 found at https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
warn: Are you sure you pushed 'u-boot-stm32-20191218' there?
The following changes since commit ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6:

  Prepare v2020.01-rc5 (2019-12-16 07:39:56 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20191218

for you to fetch changes up to eddd79291d2026f8fefebc3f5d39928d7c649241:

  stm32mp1: configs: Resync with savedefconfig (2019-12-18 11:58:36 +0100)

----------------------------------------------------------------
- Fix stm32mp1 crash (bootstage) and warning (cls)

----------------------------------------------------------------
Patrick Delaunay (3):
      stm32mp1: imply CMD_CLS
      stm32mp1: remove the imply BOOTSTAGE
      stm32mp1: configs: Resync with savedefconfig

 arch/arm/mach-stm32mp/Kconfig       | 3 +--
 configs/stm32mp15_basic_defconfig   | 2 +-
 configs/stm32mp15_optee_defconfig   | 2 +-
 configs/stm32mp15_trusted_defconfig | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
