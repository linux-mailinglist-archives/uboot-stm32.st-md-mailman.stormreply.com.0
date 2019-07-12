Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3A66F61
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:58:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C782C0691A
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:58:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09DF4C06918
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:58:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCuQDQ002864; Fri, 12 Jul 2019 14:58:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Kinvs2PcgfMRls4RkfXO29BjfPEbDpAbbFl/YnXVtO4=;
 b=VKSmFd+ywsZVRZPhvsQWwgOqbXrr5rHXCs0JOwsHLxYSwWvHpRXafo97DBxvRpknaCzX
 D2NUFkY5GWDLiA/wn8EjnYv2R5sg0hzd2PsregVPq3dMeYEjkWXIkxgZO6rcc5Y4NKJT
 gRjzs7VEtC+k4lF1wf2dGnObR3jLomSHFKJl7VmIWMafqcB+g6/IlXG56CkhFoFJuwvL
 DJTk7kJxrTFn3GYeNWxkPMYrJQxqZTcJMRYu9xxn3nso06BXU3IpfI1uryw1Y3js9VQQ
 PAzOEF0iiiq0jFmakdxTW1/HEcgfJwR+vbAzXZd7c1rrNpsaqzNKOGqXWhFZ84dUJnB3 /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhja304-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:58:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81A5E31;
 Fri, 12 Jul 2019 12:58:04 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E40B2C5E;
 Fri, 12 Jul 2019 12:58:04 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:58:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:58:04 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] sysreset: syscon: add support for power off
Thread-Index: AQHVDupAZT4UYyCwzk2vvpzyApv6kabHRMGQ
Date: Fri, 12 Jul 2019 12:58:03 +0000
Message-ID: <5640f664ec304cb6aaab667ecff7332a@SFHDAG6NODE3.st.com>
References: <1558342719-11895-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558342719-11895-1-git-send-email-patrick.delaunay@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH] sysreset: syscon: add support for power
	off
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
> Sent: lundi 20 mai 2019 10:59
> 
> The new type sysreset 'POWER_OFF', introduced by commit 751fed426f87
> ("sysreset: Add a way to find the last reset") is only supported for "syscon-
> poweroff" compatible.
> 
> For details see Linux binding:
> ./Documentation/devicetree/bindings/power/reset/syscon-poweroff.txt
> 
> This patch removes the support of POWER_OFF for "syscon-reboot"
> and keeps only the COLD reset (for command reset support) and it introduces the
> compatible "syscon-poweroff"
> for the POWER_OFF case.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/sysreset/sysreset_syscon.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
