Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE5294C7E
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:24:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 157DAC3FAE0;
	Wed, 21 Oct 2020 12:24:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29BDC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:24:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC7DGm019385; Wed, 21 Oct 2020 14:24:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2RFj4GjkerKVIdaChPy/Xhih3j3GxtWnuhMTrydABLc=;
 b=vhuT658OGSPyu8d2z3lL/alDgVrRyTDztw0EnFfXCTusuanC5kO+U4Hba1E4mqfsjExg
 v7knPdXsVps8HYQhNlmMfdTqyTs/3qPoinfSbc0X3A1DEoBn61kgUqVEyt4AOE4uWYRL
 sv8IYowEVDFsIhP5m2t+ccdXaXVwnJWW6I0qa4iuALMy1T47BpCqNegB7FjHMH8aKqzm
 F9tqdc9ZhCD/cYsK8qSUx3m2ssdJOWVwQqZc/Qca2Ku90tp2v9k3dQLsr6VRqfUgJ3i1
 sDamMrDmcUGnYDbtoi2KtHzBlbbC0eaA6wWsiFW4bVLI6fQETafC/5Q62wOMg4annv1Y yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8jyv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:24:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9FAA100034;
 Wed, 21 Oct 2020 14:24:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF3822E844A;
 Wed, 21 Oct 2020 14:24:39 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:24:39 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:24:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 05/33] gpio: stm32-gpio: migrate trace to dev and log
 macro
Thread-Index: AQHWogrB3w4TviOY5EKyJA8jqzSYJqmh5KoA
Date: Wed, 21 Oct 2020 12:24:39 +0000
Message-ID: <af93b0ad-5e11-4eb4-ea3b-1aba27914bd4@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-6-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <60EE89E94C0F224F9FEAC94B8529920D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/33] gpio: stm32-gpio: migrate trace to
 dev and log macro
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

Hi Patrick

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Change debug to dev_dbg macro and define LOG_CATEGORY.
>
> Remove dev->name as it is already displayed by dev macro.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/stm32_gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index 473e364796..3b17b632db 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -4,6 +4,8 @@
>   * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_GPIO
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -329,7 +331,7 @@ static int gpio_stm32_probe(struct udevice *dev)
>  		dev_err(dev, "failed to enable clock\n");
>  		return ret;
>  	}
> -	debug("clock enabled for device %s\n", dev->name);
> +	dev_dbg(dev, "clock enabled\n");
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
