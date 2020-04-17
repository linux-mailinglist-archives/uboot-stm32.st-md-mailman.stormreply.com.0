Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EA1ADD5C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 14:37:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30136C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 12:37:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F6ACC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 12:37:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HCbJTI032502; Fri, 17 Apr 2020 14:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dT1Qna6E/mJS2ImRSwV+06Ia3a2ys3zCX+UKBrKxkz4=;
 b=RuNm3pEpnJ2uzMyah/f8E2+XPuK51NF/xuJpu7iHr5JEqj0vVcQbqgrxedhSfQXI8Qo9
 sQG9wk58ZowSZ46DSG8C+DCU20cgGZxkysUsRtpmZdEz0thcyhUOFFzsqsMQsdWGMVwa
 rSES3bmgfOiJkdzSPzRhIk2kEHEsl+rg0mUf4Psjg0BNdlHaW49Qx4tJXju8+wf3NQj3
 zAfKt7HqJoJ8mSkIcmVJlkBH4mSuw/VUDcF7QaKxoU8PNPQvUPE4S7vU6uC1gTT3KyqV
 QRrLmPbMnfjZLoQ4v/e2n1r2oQTihubi27Bt7FQ+jJ8MuU81OutLDJWXdYy6wyKRsprI VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6t9gye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 14:37:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37A1F10002A;
 Fri, 17 Apr 2020 14:37:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D5202B1893;
 Fri, 17 Apr 2020 14:37:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Apr
 2020 14:37:18 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Apr 2020 14:37:18 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/3] env: mmc: correct the offset returned
 by mmc_offset_try_partition
Thread-Index: AQHWFLTuqIvoyR3hKEqabpiPWzSQnQ==
Date: Fri, 17 Apr 2020 12:37:18 +0000
Message-ID: <026193d0-78a4-4cc7-481b-12db578a630e@st.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
 <20200319105917.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
In-Reply-To: <20200319105917.2.Ib5b400348308b65bb50d9bfff5fe681027bff4e5@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <4C79291DF6F17A439BE78C264C3DF991@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_03:2020-04-17,
 2020-04-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] env: mmc: correct the offset returned
 by mmc_offset_try_partition
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

Hi

On 3/19/20 10:59 AM, Patrick Delaunay wrote:
> The output of the function mmc_offset_try_partition must be a
> byte offset in mmc and not a multiple of blksz.
>
> This function is used in mmc_offset(), called by mmc_get_env_addr()
> and the offset is used in write_env(), erase_env() and read_env().
>
> In these function, blk_start = offset / mmc->read_bl_len
> or /write_bl_len so this offset is not a multiple of blksz.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  env/mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/env/mmc.c b/env/mmc.c
> index 902cca23ad..c24b169f3e 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -56,10 +56,10 @@ static inline int mmc_offset_try_partition(const char *str, s64 *val)
>  	}
>  
>  	/* round up to info.blksz */
> -	len = (CONFIG_ENV_SIZE + info.blksz - 1) & ~(info.blksz - 1);
> +	len = DIV_ROUND_UP(CONFIG_ENV_SIZE, info.blksz);
>  
>  	/* use the top of the partion for the environment */
> -	*val = (info.start + info.size - 1) - len / info.blksz;
> +	*val = (info.start + info.size - len) * info.blksz;
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
