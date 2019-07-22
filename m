Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A26FFA3
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:29:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F8ECD21D1
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:29:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE636CD21D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:29:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQJWu014094; Mon, 22 Jul 2019 14:29:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LAeeNrJv1NIdyK41r/odIl6Nn2gEaL8WToHH+S3cAd4=;
 b=kmJ6S6aMGzwS6kJihPb1sT6RE5YGBqR+5NICFlXI4NRPRsjJwX8JgtNVbkg+vT496TxU
 9S19B+gfUKSOEGnsKr4CIgapnj8luNym+AWPcpy8vKOco5RfrKIfjteX8uKWCgvAHhaa
 goONtD+UDXl0aysUP1FxcKiuz7cMB1VSIzfGHdn+OR9y/KWcYV/7CSU9KfWNHCTUcjfb
 hwxNwbNATFHjVvBuRPw4JRnQhEsvo5rikSDsgIORR9/X8AxWRIvely+tZCKVTDmdLfOg
 tOWN0F3MLtnyPHWUV0QGKATGzuhAExeCLKy6A8ILvT0D1YWRaoIx7Vuq9Rl3/e1TJ7KY cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tur39bqug-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:29:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DBB831;
 Mon, 22 Jul 2019 12:29:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D33B2CBB;
 Mon, 22 Jul 2019 12:29:18 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 14:29:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:29:17 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Christophe KERELLO <christophe.kerello@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, "Andreas
 Dannenberg" <dannenberg@ti.com>, Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 4/7] remoteproc: add elf file load support
Thread-Index: AQHVF7JnKg0acaG8WUuHpDKfZvfwoabW4qnA
Date: Mon, 22 Jul 2019 12:29:17 +0000
Message-ID: <aab69730b4f84793a3e0c3427fa828b4@SFHDAG6NODE3.st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1559308296-17027-5-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_09:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] remoteproc: add elf file load
	support
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
> The current implementation supports only binary file load.
> Add helpers to support ELF32 format (sanity check, and load).
> Note that since an ELF32 image is built for the remote processor, the load function
> uses the device_to_virt ops to translate the addresses.
> Implement a basic translation for sandbox_testproc.
> 
> Add related tests. Test result:
> => ut dm remoteproc_elf
> Test: dm_test_remoteproc_elf: remoteproc.c
> Test: dm_test_remoteproc_elf: remoteproc.c (flat tree)
> Failures: 0
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/Makefile           |   2 +-
>  drivers/remoteproc/rproc-elf-loader.c | 106 +++++++++++++++++++++++++++++
> drivers/remoteproc/sandbox_testproc.c |  19 ++++++
>  include/remoteproc.h                  |  30 ++++++++-
>  test/dm/remoteproc.c                  | 122
> ++++++++++++++++++++++++++++++++++
>  5 files changed, 275 insertions(+), 4 deletions(-)  create mode 100644
> drivers/remoteproc/rproc-elf-loader.c
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
