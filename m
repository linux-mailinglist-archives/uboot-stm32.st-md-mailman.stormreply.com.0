Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45288372B8A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 May 2021 16:01:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02312C59783;
	Tue,  4 May 2021 14:01:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE3E8C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 14:01:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144Dv6or031590; Tue, 4 May 2021 16:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BmpZ50IxZMjZVj9IuVVjmbkBaC9xMieMmAIXpsihZjQ=;
 b=JxIvtjLaCeShxASbA9qiHMx/DgakwEbo/O6Pw6dWRpnJyMS2PpQDF6Y5Hai++DqYFGbx
 JD4HXn1VwXWZEnfZuJrTJ8XXEq6fVA6MwoxXgOZq0HuVWaMTDH4ABpkn6sYGsfcJuiTw
 GpDnQpgHF0y8Er7sxmK3FAd4I+Kq3OzsJ8rseY+DB68DHdyMHSiycDn/0q1hSsys2RrR
 S7NzP5ZwvX+v8PYF/ic50LGPbVuUk4eDMhUQ/+5t2hqdXKINmLl/FNXVnrvtO62fOxvt
 ns/+5qnEi677p1xgoT5AdfPn/KWuEc2Bvpqzh2srvotKrgu+NacdqJ89p45ou0ftNg6X LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38ar8dnmd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 16:01:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16C6E10002A;
 Tue,  4 May 2021 16:01:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E75E3231DD6;
 Tue,  4 May 2021 16:01:24 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 16:01:24 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210428114245.21229-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <498b4e80-e32e-a6dc-be84-e8054941b98d@foss.st.com>
Date: Tue, 4 May 2021 16:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210428114245.21229-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_08:2021-05-04,
 2021-05-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Pankaj Dev <pankaj.dev@st.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix bank and offset
	computation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 4/28/21 1:42 PM, Patrice Chotard wrote:
> BITS_PER_LONG is used to represent register's size which is 32.
> But when compiled on arch64, BITS_PER_LONG is then equal to 64.
>
> Fix bank and offset computation to make it work on arch32 and
> arch64 and ensure that register's size is always equal to 32.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> ---
>
>   drivers/reset/stm32-reset.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
> index daa2e47ebb..bbc6b135a9 100644
> --- a/drivers/reset/stm32-reset.c
> +++ b/drivers/reset/stm32-reset.c
> @@ -40,8 +40,8 @@ static int stm32_reset_free(struct reset_ctl *reset_ctl)
>   static int stm32_reset_assert(struct reset_ctl *reset_ctl)
>   {
>   	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
> -	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
> -	int offset = reset_ctl->id % BITS_PER_LONG;
> +	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
> +	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
>   
>   	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
>   		reset_ctl->id, bank, offset);
> @@ -61,8 +61,8 @@ static int stm32_reset_assert(struct reset_ctl *reset_ctl)
>   static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
>   {
>   	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
> -	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
> -	int offset = reset_ctl->id % BITS_PER_LONG;
> +	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
> +	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
>   
>   	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
>   		reset_ctl->id, bank, offset);


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
