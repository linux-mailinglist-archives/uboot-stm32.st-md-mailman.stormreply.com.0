Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009966F51
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:56:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5B46C06911
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:56:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0320FC064F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:56:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCu8A9015022; Fri, 12 Jul 2019 14:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0OxdvZ4cViZcl4bWrRQMblrGP1g6yqo0LvG+osBFurk=;
 b=oKizXdsiN3RNAzc8TFE4eeQuRWQMGSzjIHnasqtBMyr6F66ymg9gYmf48qGWfRcdzyeW
 osVqMmwJ3/76VBv+HKjIy1IFTPcfKx1McgaCIxdO3T3R3swWNwtVUD/wulne4HexgUbP
 Et9ksiLTdokRdV4XxznnC4U6YTjr8EpgNCidJ6WrpeDEK+KhT5eY8ztvz5VkojHDjSoH
 6NzFnFxNhIWc4IwzkyDBDOlzvdyWRxaJ1ZFKjHi9MHaYoYg61AcBNziXzdOAm5+2dv4/
 lUW4wQCjW7oF7bxDwuo/z0UN+Hhq+etK+gUltIvZez5M05+ft6czm6PD4mIEFyKmoUyP hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tk3fq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:56:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 505BE31;
 Fri, 12 Jul 2019 12:56:04 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F2CE2C57;
 Fri, 12 Jul 2019 12:56:04 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:56:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:56:03 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] stm32mp1: move CONFIG_ENV in Kconfig
Thread-Index: AQHVIqErjKUzxYMpskW3CyVODsOBAKbHHIFg
Date: Fri, 12 Jul 2019 12:56:03 +0000
Message-ID: <a470efe96a994f94a84646fcdaa6f101@SFHDAG6NODE3.st.com>
References: <1560510360-14446-1-git-send-email-patrick.delaunay@st.com>
 <1560510360-14446-3-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1560510360-14446-3-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 York Sun <york.sun@nxp.com>, Vipul Kumar <vipul.kumar@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: move CONFIG_ENV in Kconfig
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
> Sent: vendredi 14 juin 2019 13:06
> 
> Move 2 ENV configuration flags in board Kconfig
> - CONFIG_ENV_SECT_SIZE
> - CONFIG_ENV_OFFSET
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  board/st/stm32mp1/Kconfig  | 6 ++++++
>  env/Kconfig                | 5 ++---
>  include/configs/stm32mp1.h | 5 -----
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
