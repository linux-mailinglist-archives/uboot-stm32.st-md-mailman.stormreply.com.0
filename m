Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B561812D0
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 09:22:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4829C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 08:22:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1AA2C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 08:22:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B8J0Yv016703; Wed, 11 Mar 2020 09:21:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=RsDGZ5x3g+s75LMyoPMr7WvFb7BLmpdE1e/f8NhSWIc=;
 b=061tgMN50CmrOS1ORL7nGvU93rztGIVt0Q3TjzyzYfXuhCmSXHAF+t3+CKWzpPPVsRWQ
 A8tolYE8AMEHBcZHJx7EVnvUhJHYQaTVfWpEIkKf9Usv8KAK07FslZL4b4zgN2MBpIG4
 RuDE6Vz+xk6lhQIWJ/jgmfW7OtMpb4xnQRf7a7O+Q7Thz64kRjXrINkaR/z9nefcUmh+
 daeXGhcO7R6/5Q56TR0BGS5vD5TxyE6qfYpV3EyoZgxxsQsWUEfTF9UULN6z2fXERlrw
 Uh2wnQhKHw60HA3I7gE5KMYIsFfZO/EMq0OCKcRrz8WxHBdZOy9B6jiNYPc5jjrC9Svv rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1y6s7rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 09:21:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 783F510002A;
 Wed, 11 Mar 2020 09:21:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 653D821C091;
 Wed, 11 Mar 2020 09:21:53 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Mar
 2020 09:21:53 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 11 Mar 2020 09:21:53 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm32 =u-boot-stm32-20200310
Thread-Index: AdX3fPD7wqPbShDCS26HqgZTmTeF6w==
Date: Wed, 11 Mar 2020 08:21:53 +0000
Message-ID: <bd0e30dec781493d9797eea097bff7e0@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-10,
 2020-03-11 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	=u-boot-stm32-20200310
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

Please pull the STM32 related fixes for v2020.04-rc4 = u-boot-stm32-20200310

With the following changes:
- stm32mp: fix dependency for CONFIG_STM32_ETZPC

CI status:
     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2399

Thanks,
Patrick

The following changes since commit 9f976bac2b4a81a13de8124a896a198cbeabb634:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-x86 (2020-03-05 07:51:12 -0500)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20200310

for you to fetch changes up to 7a02e4d53c4a44a565cc9228bd1b78e0a2bdd6b5:

  stm32mp: update dependency for STM32_ETZPC (2020-03-10 18:11:02 +0100)

----------------------------------------------------------------
- stm32mp: fix dependency for CONFIG_STM32_ETZPC

----------------------------------------------------------------
Patrick Delaunay (1):
      stm32mp: update dependency for STM32_ETZPC

 arch/arm/mach-stm32mp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
