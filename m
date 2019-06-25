Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB952609
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:06:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0DF2C5F1E8
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:06:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85CE9C5F1E7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:06:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P832FX029881; Tue, 25 Jun 2019 10:06:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pHuCHXR8+Ay/W/hp6+OXWXubcFx7DKnRUWQeNRk1Mz0=;
 b=hkchwu2qKeuKfJN0xT83QvXBwojQIZDsJN83GhB9WPTTGUi8FUKfiS+sUoCb3uPDsGh7
 j4ZaUjZB6E4ngHOk7ysOxraQYd7wirDvWp6e1ImdQ3Yf0GiDbDT8/o6bOdZC2lQgdIJh
 kenxLwtzQ8/bpXislAwOSH/RE04fY1itIPTevtmDworwVNigYXk4RnN27LK8P5J4O4g2
 WzJh0Oh5Z/pfR/4qPJMuEErnBCqVss1zpZb+2gCMtEsJw7Hk/6k9yS+Bf8bRH2OFVs3D
 jyv6vtILbJJq5duRhv7z7HrNoCd7p3SZ3FQchFnH20m5v6isH2J+fkY3ZaMCySKlgDM+ 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2jg2f9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:06:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2542F61;
 Tue, 25 Jun 2019 08:06:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4E311BEB;
 Tue, 25 Jun 2019 08:06:16 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 25 Jun 2019 10:06:16 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 25 Jun 2019 10:06:04 +0200
Message-ID: <20190625080606.21650-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 0/2] STM32 MCU dts fixes/cleanup
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

  - Remove useless u-boot,dm-pre-reloc
  - Add u-boot,dm-pre-reloc for usart1_pins_a for stm32f769-disco


Patrice Chotard (2):
  ARM: dts: stm32: Add u-boot,dm-pre-reloc for usart1_pins_a for
    stm32f769-disco
  ARM: dts: stm32: Remove useless u-boot,dm-pre-reloc in
    stm32f746-disco-u-boot.dtsi

 arch/arm/dts/stm32f746-disco-u-boot.dtsi |  6 ------
 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 10 ++++++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
