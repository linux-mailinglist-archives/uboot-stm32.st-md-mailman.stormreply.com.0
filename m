Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A96FF9E
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:28:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 617F9CD21CA
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:28:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32E96CD21C9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:28:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQpxe027520; Mon, 22 Jul 2019 14:28:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=CbcRh7rVN9EBMqZZ15aKnY8E7XfcwFdZ6/fkXU13fzY=;
 b=lju8w2m0fbIP/K4rIxLbWkC5aqa9NGu3K51RtwbtTiXvv3KeLvLgpOfp616LvOycHKAc
 FnogdBoaixE1TO+tvvluReLcg0+D6dMNbBsDbwfPLbJUiWbvEMYVrBaaQb0Fw6vkYpW8
 X7gt1aVcxbS3ITbhLLjPj1ThihftbjhliRTCJ3j5sqTNGUUGDmpA0ZEFqPxxViW6amKz
 IUWSRryLEGSdg4Vy4Yc8wZcf3ParIHDjmUQUK22ajYGeDAVfvf+oiymxKj10dij997yj
 uWqdNuSG5bTt+YAg71xlXxIyY7yTUvbaelJjpdAfoCa029bcL9UG7Yd1gh/rvnMk9pR+ uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tusuj3bbe-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:28:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE95138;
 Mon, 22 Jul 2019 12:28:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C2A12CE6;
 Mon, 22 Jul 2019 12:28:32 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 22 Jul
 2019 14:28:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:28:31 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Christophe KERELLO <christophe.kerello@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, "Andreas
 Dannenberg" <dannenberg@ti.com>, Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 2/7] remoteproc: fix function headers
Thread-Index: AQHVF7JmS3m5F1qLnkSoGtHFnXaRM6bW4nGg
Date: Mon, 22 Jul 2019 12:28:31 +0000
Message-ID: <ce2ce6585a34438eb71b15b2ca0189a7@SFHDAG6NODE3.st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-3-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1559308296-17027-3-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] remoteproc: fix function headers
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

> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: vendredi 31 mai 2019 15:12
> 
> Add full function comment headers.
> Fix rproc_is_initialized() return value description.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  include/remoteproc.h | 104 +++++++++++++++++++++++++++++++++-------------
> -----
>  1 file changed, 68 insertions(+), 36 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
