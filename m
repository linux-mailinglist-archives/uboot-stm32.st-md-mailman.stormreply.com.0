Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA66294C95
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:28:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36DB8C3FAE0;
	Wed, 21 Oct 2020 12:28:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27A47C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:28:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCRpEa004674; Wed, 21 Oct 2020 14:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MnT5c5A4jpl9s8De438IwGPxnSHbMWBrKVJI4FL4RNQ=;
 b=XauoXc29UGvsHdjT3mJ4SaGfkkS5xvD9ejEkT1TyHXYYc1sRWVmcixW9hlhz4JIeTZ6/
 P/JXo3v+tl+bM7ZLMdtDMJ7z5J8lSlymHfjbKl9qWQCaVfyialquxtJ/tD4mYJKK4SN6
 SN0YH+NmgZDidvV7DjK52qsLcLlZticZQkhWbsYIVwlpC6zTLQ55FqAEl5bw/bn4ENoR
 WyfrULonJDQxGLS/4RvIbtH8zPZJY1Fi55wSHfjel2MaaLXB0jmgsgngeSY4pVEnyAia
 Z+yeMerMGAWgmNCE6xcX5fywVDJ6Uz2s9yOMO0I+OERYk6wyvoMqeFIcGWFgL/W8sLNu 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggahxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:28:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A222710002A;
 Wed, 21 Oct 2020 14:28:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 971132E8457;
 Wed, 21 Oct 2020 14:28:15 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:28:15 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:28:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 16/33] misc: rcc: keep the rcc device name for subnode
Thread-Index: AQHWogrH1UqbU+bRuU6yq/NpK7Orzqmh5asA
Date: Wed, 21 Oct 2020 12:28:14 +0000
Message-ID: <c3eb968e-62e1-42bb-7ae2-6e59b3cfb1ff@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-17-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-17-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <3E80C9640A75974C86929354686D483F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 16/33] misc: rcc: keep the rcc device name
	for subnode
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
> Update the name associated with the RCC drivers to avoid
> duplicated name with the driver name.
>
> With this patch the traces displayed with log macro provide a
> correct device name.
>
> The rcc device name before the patch is:
>
>  Class     Index  Probed  Driver                Name
> -----------------------------------------------------------
>  root          0  [ + ]   root_driver           root_driver
>  simple_bus    0  [ + ]   simple_bus            |-- soc
>  (...)
>  nop           0  [ + ]   stm32-rcc             |   |-- rcc@50000000
>  clk           0  [ + ]   stm32mp1_clk          |   |   |-- stm32mp1_clk
>  reset         0  [ + ]   stm32_rcc_reset       |   |   `-- stm32_rcc_reset
>
> And they become:
>  (...)
>  nop           0  [ + ]   stm32-rcc             |   |-- rcc@50000000
>  clk           0  [ + ]   stm32mp1_clk          |   |   |-- rcc@50000000
>  reset         0  [ + ]   stm32_rcc_reset       |   |   `-- rcc@50000000
>
> The traces is correct:
> stm32mp1_clk rcc@stm32mp1_clk: .....
> =>
> stm32mp1_clk rcc@50000000: .....
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> ---
>
>  drivers/misc/stm32_rcc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
> index c1a99d78e2..e46685f0e1 100644
> --- a/drivers/misc/stm32_rcc.c
> +++ b/drivers/misc/stm32_rcc.c
> @@ -54,7 +54,7 @@ static int stm32_rcc_bind(struct udevice *dev)
>  		return -ENOENT;
>  	}
>  
> -	ret = device_bind_with_driver_data(dev, drv, rcc_clk->drv_name,
> +	ret = device_bind_with_driver_data(dev, drv, dev->name,
>  					   rcc_clk->soc,
>  					   dev_ofnode(dev), &child);
>  
> @@ -67,7 +67,7 @@ static int stm32_rcc_bind(struct udevice *dev)
>  		return -ENOENT;
>  	}
>  
> -	return device_bind_with_driver_data(dev, drv, "stm32_rcc_reset",
> +	return device_bind_with_driver_data(dev, drv, dev->name,
>  					    rcc_clk->soc,
>  					    dev_ofnode(dev), &child);
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
