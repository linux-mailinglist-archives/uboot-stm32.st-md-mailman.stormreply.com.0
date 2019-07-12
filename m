Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 807CA66C53
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:14:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A590D3FD31
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:14:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13C48D3FD30
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:14:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CC6YiN003374; Fri, 12 Jul 2019 14:14:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=V8uW6VIDdywy2G5CGs++imRaNq7y5rrm8DrsIrdVFHw=;
 b=NP36BdZUJh81MvZyrEDqeSzz8NDpMZaWrxkgpxQncQa1nTaNHDJN9j/JwOFB7d2UIcD2
 oAnBKZ7ewuHDToA3gRKgtQmljcAtBn1dQU5ANeWF2s/7H8GNi/2ThS8XktzaFroMEmlV
 +t6znVMue32r3Sw4ecN4nQzsR7Zcxbh1Czs1pm+4Qa/G3xDcTNxbSLu8y0B8fSf0XfxU
 93j4O02NUid+yvNCmqv8TX6yZniusljh6EB4HJYoTmx6Tidj+g7T+JWH95UJOU2PKUOk
 iiZNYnUahF1tZSFoqH2Iu12Ls0EjHVI/qee0Cj9zNMfv4xdppcm922BQmqtH2ALDEFPa QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51r7qf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:14:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 685ED3D;
 Fri, 12 Jul 2019 12:14:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F68D2B66;
 Fri, 12 Jul 2019 12:14:41 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:14:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:14:40 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 06/16] stm32mp1: export get_cpu_package function
Thread-Index: AQHVM0UxMcy3d8T6DkmrXpotedkGV6bG8B/A
Date: Fri, 12 Jul 2019 12:14:40 +0000
Message-ID: <1dd95a09ee5447f8834143ddfea9fe4d@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-7-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-7-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 06/16] stm32mp1: export get_cpu_package
	function
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

> To: u-boot@lists.denx.de
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; U-Boot STM32 <uboot-
> stm32@st-md-mailman.stormreply.com>; Patrice CHOTARD
> <patrice.chotard@st.com>; Albert Aribaud <albert.u.boot@aribaud.net>
> Subject: [PATCH v2 06/16] stm32mp1: export get_cpu_package function
> Importance: High
> 
> Prepare update of package information update in Linux device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/mach-stm32mp/cpu.c                    | 7 +------
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 9 +++++++++
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
