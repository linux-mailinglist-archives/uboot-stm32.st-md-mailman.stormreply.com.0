Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2E66F6F
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 15:02:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC350D40910
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 13:02:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD6D7D4090F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 13:02:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CD2GK0007099; Fri, 12 Jul 2019 15:02:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hL0rp0rUPDWomUtPmFKpp1mDKzufFA1NaS/eQ2n0vJw=;
 b=jea9mwrEFzeJEiP5altI5+NW/2HhqiT6mnd8Xk2I0JIgfnXww76hd3JKej13xDymm9Sz
 Da3p8a7RlMNyAg9tpNWS7NCn2mn9nPaC+IYamf2lMayZtPiqT/S+9s3KXcIbvnNz336h
 Dgi3ItANt06Hvse9Ab/NqS1u2x4Y5irB+fBXwRylTzIAhySTyzgwemfztyWqsAmTEO0s
 uRnhvX0dqDsLRwHiDwPTOzhaJ5Aqr6Y1nCMy1Nl2DHO+LC7gbFFAzD+C56SvmBz6T5wW
 PJc7U6CbVkNz9XMIaPe6RYa029GZTOeaz4GV+MuauEv3M1WFb7Vm1YxUOVY+mGmeLkfx PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhja3r1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 15:02:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFFFD49;
 Fri, 12 Jul 2019 13:02:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB8952C8C;
 Fri, 12 Jul 2019 13:02:08 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 15:02:08 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 15:02:08 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] stm32mp1: add SPI flash support in SPL
Thread-Index: AQHVKDbVmDE2ZyBbNkGzYrmpCPJwhKbHE3lw
Date: Fri, 12 Jul 2019 13:02:08 +0000
Message-ID: <d17cb97bf5c349a385d20ed2cbefe1d2@SFHDAG6NODE3.st.com>
References: <1561124396-2581-1-git-send-email-patrick.delaunay@st.com>
 <1561124396-2581-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561124396-2581-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: add SPI flash support in SPL
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

Hi,


> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 21 juin 2019 15:40
> 
> Allow boot form NOR with basic boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
