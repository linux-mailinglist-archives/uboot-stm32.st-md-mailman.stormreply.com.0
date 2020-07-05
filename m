Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6A21506B
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 01:53:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47532C36B29
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 Jul 2020 23:53:58 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F3B1C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jul 2020 23:53:56 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200705235353epoutp0390966d5bb60cef4e3c06fe0a78ede748~fAGaAifGF1116911169epoutp03e
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jul 2020 23:53:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200705235353epoutp0390966d5bb60cef4e3c06fe0a78ede748~fAGaAifGF1116911169epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593993233;
 bh=Vq56KkNuiXhSzMLxsp9LN3fJFKX+TelyDlLJN3CwyBM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=RHuOlCzu76mC4yH7PD7YUULZD3TJH5n+pYVtcL2Uiui5uMLWQifLFjfjHIgocvOV6
 dZk79e0N5kGZIrXQVAXrJeGt33zeolBUDSEGM+ZDMcBxNqhMsaGviP/sH8d7qjUUzK
 sU341WqX+LZ/VEDf91Oj9v6Pco9lRgrmZXRjvn40=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200705235353epcas1p2cb9a5a2e98fe1b8bf42b6bb5f7c995bc~fAGZsyScD2410924109epcas1p2o;
 Sun,  5 Jul 2020 23:53:53 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4B0QWy4yG4zMqYkk; Sun,  5 Jul
 2020 23:53:50 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 86.10.28581.E08620F5; Mon,  6 Jul 2020 08:53:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200705235350epcas1p4a33b11b752d1ab2e268d1abc30a65936~fAGXOPMmU0536805368epcas1p4B;
 Sun,  5 Jul 2020 23:53:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200705235350epsmtrp136a82e3e27da4ac30bef52009df7a59b~fAGXNrhS23231832318epsmtrp1N;
 Sun,  5 Jul 2020 23:53:50 +0000 (GMT)
X-AuditID: b6c32a38-2cdff70000006fa5-6c-5f02680e1ae6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.1D.08382.E08620F5; Mon,  6 Jul 2020 08:53:50 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200705235350epsmtip250ad69ce05443e8b71fec38449a93add~fAGXDUrZw3243532435epsmtip2X;
 Sun,  5 Jul 2020 23:53:50 +0000 (GMT)
To: Patrice CHOTARD <patrice.chotard@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <8da3e9b0-f8d4-aa3a-60d8-fff93ed4839f@samsung.com>
Date: Mon, 6 Jul 2020 08:53:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <aa5afa7c-b299-6e0d-25b5-5720f8c80d2a@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZdlhTT5cvgyneYNEfVYvpy58zWcw5cZXR
 YuWl/6wWb/d2slss3LqcxYHV4+ydHYweB/cZejz9sZc5gDkq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8CyQK84Mbe4NC9dLzk/18rQwMDIFKgwITvj5aFnrAW7hCp2fFrD3MD4m6+L
 kZNDQsBEYvKpF+xdjFwcQgI7GCW+X+hhg3A+ATm9h6Ey3xglWvZ1AmU4wFqWv4iEiO9llNi+
 8xczhPOeUWLZ05NsIHOFBZIk1qy8ywKSEBHoZJTY3PqQESTBLJAu8WbhTBYQm01AR2L7t+NM
 IDavgJ1E24aNYHEWARWJF2evgtWLCkRIHO+ezA5RIyhxcuYTsBpOASuJHdO/sUPMFJe49WQ+
 E4QtL7H97RywiyQEPrJL3JuzkgXiUxeJTW072CBsYYlXx7ewQ9hSEi/726DsaoldzWegmjsY
 JW5ta2KCSBhL7F86mQnkf2YBTYn1u/QhwooSO3/PhXqMT+Ld1x5WSBDxSnS0CUGUqEhcev2S
 CWbV3Sf/WSFsD4kfl1oYJzAqzkLy2iwk78xC8s4shMULGFlWMYqlFhTnpqcWGxaYIEf3JkZw
 etSy2ME49+0HvUOMTByMhxglOJiVRHh7tRnjhXhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+
 MEHnlcQbmhoZGxtbmBiamRoaKonznrS6ECckkJ5YkpqdmlqQWgTTx8TBKdXApBKu7tdZfUSK
 +2zO4R9cbWve6NpzSv8ONp7xT4FfaM3Sm30zb9W97OPNXHbzKYfQpGy/JOfK6NTi5rUH2yp5
 v3bbmfC0btz/13vLN5Ev660iIj7vuhux4Yht0WrWXWzxZ3/futb5tIX/3D2Nyz/lJG5qWh7h
 +nDZRqx3lVrxi6s+n3OS1Fcm/TQXyc216eR9ViubzDxbijddqnf2pFW/57+b+2Bt/QfD/emH
 hQwOPFcR+eudd/lMsUNvmwQf58e+rw93cil+f6A6x2j2yRh15bUrsm6Im5Uv8VxzdX5v8Bwu
 S40DGqVSm+Ytz6idN6VTP7jMxffQ1mu+64LunkkW1DuenbVKzjBoscCBnbzsSizFGYmGWsxF
 xYkAy+gV7RgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvC5fBlO8wdkZghbTlz9nsphz4iqj
 xcpL/1kt3u7tZLdYuHU5iwOrx9k7Oxg9Du4z9Hj6Yy9zAHMUl01Kak5mWWqRvl0CV8bLQ89Y
 C3YJVez4tIa5gfE3XxcjB4eEgInE8heRXYxcHEICuxkl9kw4ytjFyAkUl5L4/HQqG0SNsMTh
 w8UQNW8ZJc69PAZWIyyQJLFm5V0WEFtEoJtR4sarChCbWSBd4sm6DywQDVcZJe68Os4KkmAT
 0JHY/u04E4jNK2An0bZhI1gzi4CKxIuzV8GGigpESLTc/8MOUSMocXLmE7AaTgEriR3Tv7FD
 LFCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02
 LDDMSy3XK07MLS7NS9dLzs/dxAiOBi3NHYzbV33QO8TIxMF4iFGCg1lJhLdXmzFeiDclsbIq
 tSg/vqg0J7X4EKM0B4uSOO+NwoVxQgLpiSWp2ampBalFMFkmDk6pBibnXu2KUPXPDB1b8/qv
 nnj2RvrhLo/3YV89lsmq2sv8MuWYyfHFItmE+9lmmbi0WZqvMh9IPbujtenLYZf6i6bvZv6K
 2mLCpLLqgQtzVqN3l3XR7twvb2ZV3vSasOmxoR9X8dazfh3/A+OunZt+be2dwvhfzWZf3d98
 LEr4NnHOC7N8uQ3V9+2lkkUMdS62zWdeHfqj2+22voe5pJ5hfUJH/9MlEQl8s1tfXj6uyb2a
 ccoEnX6Nk4WKRaZnpy/MnJg2qcTrdIf8t2OsHaVCG0s4k74qC8TOfL71Y8GWjpDJWyoaqpdz
 zl3855eM2t8LC+f2CX9du8f8pVF5/ceZT6Y3nvV71rW9Uom/M+zMb3MlluKMREMt5qLiRAA9
 KiMJ9QIAAA==
X-CMS-MailID: 20200705235350epcas1p4a33b11b752d1ab2e268d1abc30a65936
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200702072810epcas1p1fac97cb4083e106cc896ec186494d133
References: <20200612104052.1.Idb6dab984884f50e47f061ac36fa89da760babd4@changeid>
 <CGME20200702072810epcas1p1fac97cb4083e106cc896ec186494d133@epcas1p1.samsung.com>
 <aa5afa7c-b299-6e0d-25b5-5720f8c80d2a@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] power: regulator: stm32: vrefbuf: fix a
 possible overshoot when re-enabling
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

On 7/2/20 4:28 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 6/12/20 10:40 AM, Patrick Delaunay wrote:
>> From: Fabrice Gasnier <fabrice.gasnier@st.com>
>>
>> There maybe an overshoot:
>> - when disabling, then re-enabling vrefbuf too quickly
>> - or upon platform reset as external capacitor maybe slow
>>   discharging (VREFBUF is HiZ at reset by default).
>> VREFBUF is used by ADC/DAC on some boards. An overshoot on the reference
>> voltage make the conversions inaccurate for a short period of time. So:
>> - Don't put the VREFBUF in HiZ when disabling, to force an active
>>   discharge.
>> - Enforce a 1ms OFF/ON delay, also upon reset
>>
>> Penalty is a 1ms delay is applied (even for a cold boot), when enabling
>> VREFBUF.
>>
>> Fixes: 93cf0ae7758d ("power: regulator: Add support for stm32-vrefbuf")
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  drivers/power/regulator/stm32-vrefbuf.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/regulator/stm32-vrefbuf.c b/drivers/power/regulator/stm32-vrefbuf.c
>> index 250773514f..92136961c2 100644
>> --- a/drivers/power/regulator/stm32-vrefbuf.c
>> +++ b/drivers/power/regulator/stm32-vrefbuf.c
>> @@ -43,8 +43,20 @@ static int stm32_vrefbuf_set_enable(struct udevice *dev, bool enable)
>>  	u32 val;
>>  	int ret;
>>  
>> -	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ | STM32_ENVR,
>> -			enable ? STM32_ENVR : STM32_HIZ);
>> +	if (enable && !(readl(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR)) {
>> +		/*
>> +		 * There maybe an overshoot:
>> +		 * - when disabling, then re-enabling vrefbuf too quickly
>> +		 * - or upon platform reset as external capacitor maybe slow
>> +		 *   discharging (VREFBUF is HiZ at reset by default).
>> +		 * So force active discharge (HiZ=0) for 1ms before enabling.
>> +		 */
>> +		clrbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ);
>> +		udelay(1000);
>> +	}
>> +
>> +	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_ENVR,
>> +			enable ? STM32_ENVR : 0);
>>  	if (!enable)
>>  		return 0;
>>  
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

> 
> Thanks
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
