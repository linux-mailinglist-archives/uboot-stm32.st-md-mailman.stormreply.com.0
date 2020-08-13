Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C62434EF
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:27:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8496C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:27:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C82C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:27:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D7LqRE021205; Thu, 13 Aug 2020 09:27:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WNhWJ/V0+Y9VplNIgZd+RchYoYfAcnTsd0SbFTLHnh8=;
 b=qWovVAJStwVio4IavXv253SblMVhB4aPBAeqaYtpcHiwrxFRK1JVgRBhW1GhQZvVVzjE
 BBocnrPojPsttUwU3tCENgHY8d1n2O2fBTj3wrDsiW+QGmT0GqOX0ZXcbcSXkoDWrPl2
 8S9bdLUZ/FW7StAKtuzs+lvwPkvWegEAg/E1oNbdjhR65cCEHA8vVGS1Ydni421dE4C7
 Fper77lWVoHaawA9bbX5OxnMfblXs36sSqQjNiLfchklXxI2eTiqL2nyBH8Bbjc/A7UI
 nFSfA179tm9rFIAIq1iUk9szBOQ9kuG9+FnxUEdrfjc2qFAHt8tAoI4ak/lvMW9jE2fW jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9rna7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:27:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E45C910002A;
 Thu, 13 Aug 2020 09:27:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9D2E20FA57;
 Thu, 13 Aug 2020 09:27:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:27:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:27:23 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 01/11] mtd: rawnand: stm32_fmc2: fix a buffer overflow
Thread-Index: AQHWZw/czQiqemPmKEm0gBVJ1nUiq6k1lriA
Date: Thu, 13 Aug 2020 07:27:23 +0000
Message-ID: <ab6dc6b3-f0d4-a606-bcba-74808911baec@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-2-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1596182024-18181-2-git-send-email-christophe.kerello@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <34506A0DA76AAA4B81B77BB42DEEFE08@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] mtd: rawnand: stm32_fmc2: fix a
	buffer overflow
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

Hi Christpohe

On 7/31/20 9:53 AM, Christophe Kerello wrote:
> The chip select defined in the device tree could only be 0 or 1.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 3306bd8..2929acf 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -846,7 +846,7 @@ static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
>  	}
>  
>  	for (i = 0; i < nand->ncs; i++) {
> -		if (cs[i] > FMC2_MAX_CE) {
> +		if (cs[i] >= FMC2_MAX_CE) {
>  			pr_err("Invalid reg value: %d\n",
>  			       nand->cs_used[i]);
>  			return -EINVAL;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
