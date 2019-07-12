Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76166CDC
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:24:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E8A1D3FD47
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:24:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93178D3FD46
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:24:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCMG4p010797; Fri, 12 Jul 2019 14:24:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fc0LCz1xD/GgtPsob1Roz0fS2LLjikYGNJJQq+5oB1w=;
 b=aqbqW4Wd3P94odlFwXn/a571KfEWYfsr9BQzw6jtQZBAPD6Dsm2Xic94YBxk6Bqcc1MW
 brYbGkJOGi7JBFX89cog+63pDzEVK9sZgFlzhNZxOjHqrSQMOFBFoNqQb2wFt61/Glh7
 ht9Rnm23MKG7sOXU+t0GCPdI2M+pXhvEilcfmbtAaMY5Wyeb3SaKik7dGifWLU3g3ZSs
 uyoPJz2vESlAHFKaZ74iMA7bHKm2lZ3wq5e+vpPYHjnLB4zgV0aYr3447GqPGpRSU7/L
 4Bq9L9RRJ1SDPZG1xj3AGXeyC3LyPwgR8d1v+SRiYgUWu/K4rd9JqxN0rOdlKIwaGFtu iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhj9w9p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:24:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2931131;
 Fri, 12 Jul 2019 12:24:03 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1722929D3;
 Fri, 12 Jul 2019 12:24:03 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:24:02 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:24:02 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 14/16] stm32mp1: add check for presence of environment
 in boot device
Thread-Index: AQHVM0U4d/hoPrcd30STdocmxLxxq6bG8q7Q
Date: Fri, 12 Jul 2019 12:24:02 +0000
Message-ID: <cd390146fc52416db3f088d706dc36bd@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-15-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-15-git-send-email-patrick.delaunay@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v2 14/16] stm32mp1: add check for presence
 of environment in boot device
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
> Sent: vendredi 5 juillet 2019 17:20
> 
> For boot from flash, check presence of default environment to force save env.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  include/configs/stm32mp1.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
