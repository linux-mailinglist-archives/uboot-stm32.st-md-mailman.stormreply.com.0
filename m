Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDC26B980
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 03:50:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D1BFC3FADE
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 01:50:11 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57C2EC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 01:50:09 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200916015006epoutp041c904647b63b7c94f3617c8302e5bf84~1IIbrYXCW1229612296epoutp043
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 01:50:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200916015006epoutp041c904647b63b7c94f3617c8302e5bf84~1IIbrYXCW1229612296epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600221006;
 bh=qxNXdR/VLSIJTMf+q1cg5jH2ZCifa70m/9TmgL3YXDg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DgEJfmn9TFAfsQ9OZXmltIaODRm7eJH3yFp76zPI99t8QV6TH04Gj1y0tIZxEWDsI
 kj5DQ7kRS6UKCTgYph0Epb2icTWUwt99Lm6o0pFW23t+AVaXXskRacs0QHYXZzTRNl
 57Z74VWuqfCWYjYHE8F3Dht9U0/gBfSzNDGj/F7I=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200916015005epcas1p43010a97c86e5f6cce903f94f9388b0f0~1IIa8-ccu2340123401epcas1p4F;
 Wed, 16 Sep 2020 01:50:05 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Brjhp3JCmzMqYkY; Wed, 16 Sep
 2020 01:50:02 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 72.A1.20696.74F616F5; Wed, 16 Sep 2020 10:50:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200916014959epcas1p18aceb6ff767ba7a884d5c39ea545818f~1IIVHjIfL0992309923epcas1p1i;
 Wed, 16 Sep 2020 01:49:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200916014959epsmtrp19d7a00b493a10880491ba6994086d7d9~1IIVG-VF30758007580epsmtrp1o;
 Wed, 16 Sep 2020 01:49:59 +0000 (GMT)
X-AuditID: b6c32a39-eebff700000050d8-1d-5f616f47ec94
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7D.95.08382.74F616F5; Wed, 16 Sep 2020 10:49:59 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200916014959epsmtip29937c83de5fb31dbe48408ce4c049f8e~1IIU5g9_Y1877818778epsmtip2h;
 Wed, 16 Sep 2020 01:49:59 +0000 (GMT)
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Alexandru Gagniuc
 <mr.nuke.me@gmail.com>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <399c61e7-9771-6cf2-cf79-e320a69dd1cd@samsung.com>
Date: Wed, 16 Sep 2020 10:50:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2cb173a6d4834550805337bf76545a12@GPXDAG6NODE6.st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmnq5HfmK8waoORotZ96+wWsw5cZXR
 YuWl/6wWP1Z9YbV4u7eT3WLh1uUsDmweO2fdZfc4e2cHo8fGdzuYPA7uM/R4+mMvcwBrVLZN
 RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAFSgpliTml
 QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjNal
 11gLmgUr/p16y9LA+Ji3i5GTQ0LARGL1sydMXYxcHEICOxgl/rTvYodwPjFKbDl+mA3C+cYo
 8ebkX3aYlgf3TzJCJPYySkxc2cgC4bxnlPh3sJUFpEpYIExi3cNusISIwGagwVcfMYEkmAWq
 JP4saGUDsdkEdCS2fzsOFucVsJNovTIXrJlFQFWi41cbI4gtKhApsfPpS3aIGkGJkzOfgNVw
 CjhL/NzeAzVTXOLWk/lQtrzE9rdzmEEWSwi0ckh8XXyPBeJuF4mJlz6zQdjCEq+Ob4H6R0ri
 ZX8blF0tsav5DFRzB6PErW1NTBAJY4n9SycD2RxAGzQl1u/ShwgrSuz8PZcRYjGfxLuvPawg
 JRICvBIdbUIQJSoSl16/ZIJZdffJf1YI20Pi2L0trBMYFWcheW0WkndmIXlnFsLiBYwsqxjF
 UguKc9NTiw0LTJHjexMjOH1qWe5gnP72g94hRiYOxkOMEhzMSiK8Bxrj44V4UxIrq1KL8uOL
 SnNSiw8xmgIDeyKzlGhyPjCB55XEG5oaGRsbW5gYmpkaGiqJ8z68pRAvJJCeWJKanZpakFoE
 08fEwSnVwDRz5tE5PFEnlhSdmyHp7vr3eLTv17zG7KAv5qJrW/aw1O7Ws2VfeqLx8A9dlkLl
 3f+mVfz6WZBuv2p5yPnMqSvjbhxas6Hyj9+a4jdaGidEJthp3tQRirf9eVx72nZNnc0iy7l/
 Sh/r3D1H24nZmnGJTGq56ef0rcbBD++L9n96eiHkH7/A+tBTB5JesZwQuVqU+tBQfKf18jTt
 1b6HXqgceFVmJjhh+rO6GKWzflfm3wjaaujQsb3xh82Law88znXl3LjpoFAupGzgH745JI1B
 6pJLmKeP/QEW/9xLFSW7T06om88vrK4vclJkxe6is69ttvaGebOHy8Tz1B778kLBPPvVl4yH
 K0+rzriqt0yJpTgj0VCLuag4EQDvBk25KAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSvK57fmK8waKtwhaz7l9htZhz4iqj
 xcpL/1ktfqz6wmrxdm8nu8XCrctZHNg8ds66y+5x9s4ORo+N73YweRzcZ+jx9Mde5gDWKC6b
 lNSczLLUIn27BK6M1qXXWAuaBSv+nXrL0sD4mLeLkZNDQsBE4sH9k4xdjFwcQgK7GSUeLN/H
 BpGQkvj8dCqQzQFkC0scPlwMEhYSeMsosWUmWImwQJjEuofdLCC9IgJbGSVWz2xjBkkwC1RJ
 tB6cxgox9A+jxIXP8xhBEmwCOhLbvx1nArF5BewkWq/MZQGxWQRUJTp+tTGCLBMViJTYucMS
 okRQ4uTMJ2AlnALOEj+39zBBzFeX+DPvEtQucYlbT+ZDxeUltr+dwzyBUWgWkvZZSFpmIWmZ
 haRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4FjR0tzBuH3VB71DjEwcjIcY
 JTiYlUR4DzTGxwvxpiRWVqUW5ccXleakFh9ilOZgURLnvVG4ME5IID2xJDU7NbUgtQgmy8TB
 KdXAtKq7KCD+vBPzzO8H3Phd2T/WH59yr/K25bsHJz39ded//KRizfOrr9cgw1XorZm6NDvj
 Z83JGUrbYrkZL/xdXmaa+/9ma+GDt3u2MVqqL71wOnVfs1En6+wCn3KT+KK51W6e/Xd35l82
 XTg/e7mue53sLtH4Ps9I5QBfGbbltV1c+zNTZ0S8U9o/O2LpwvNKuVIK7Rvf1Dx+3cgba7j7
 TF2iyt9s9W8111hnWK7ZzPz8s7RXS2Vus3Xysu7sFfnlf1tD+kUYzTW+zvjYw6LH9enBzKyD
 zGFCDCFvtrfr7RN1PTLpgV7w57k9N1b9yqt8ss1H1XLDXP/5c8vlY72fbX/8Kfrz/WCp152/
 ncOUWIozEg21mIuKEwHsz71IBAMAAA==
X-CMS-MailID: 20200916014959epcas1p18aceb6ff767ba7a884d5c39ea545818f
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200910005435epcas1p20d2f97d097717214bd2836fafdd140d9
References: <CGME20200910005435epcas1p20d2f97d097717214bd2836fafdd140d9@epcas1p2.samsung.com>
 <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <79b3e835-0dac-43cd-9d6e-0d31e985424b@samsung.com>
 <2cb173a6d4834550805337bf76545a12@GPXDAG6NODE6.st.com>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to
 read host capabilities
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

On 9/11/20 8:46 PM, Patrick DELAUNAY wrote:
> Hi Jaehoon
> 
>> From: Jaehoon Chung <jh80.chung@samsung.com>
>> Sent: vendredi 11 septembre 2020 09:50
>>
>> On 9/10/20 6:54 AM, Alexandru Gagniuc wrote:
>>> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
>>> struct mmc_config from devicetree.
>>> The same logic is duplicated in stm32_sdmmc2_probe(). Use
>>> mmc_of_parse(), which is more generic.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

>>> ---
>>>  drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
>>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
>>> index 6d50356217..77871d5afc 100644
>>> --- a/drivers/mmc/stm32_sdmmc2.c
>>> +++ b/drivers/mmc/stm32_sdmmc2.c
>>> @@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>>>  			     GPIOD_IS_IN);
>>>
>>>  	cfg->f_min = 400000;
>>> -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
>>>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 |
>> MMC_VDD_165_195;
>>>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>>>  	cfg->name = "STM32 SD/MMC";
>>>
>>>  	cfg->host_caps = 0;
>>> -	if (cfg->f_max > 25000000)
>>> -		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
>>> -
>>> -	switch (dev_read_u32_default(dev, "bus-width", 1)) {
>>> -	case 8:
>>> -		cfg->host_caps |= MMC_MODE_8BIT;
>>> -		/* fall through */
>>> -	case 4:
>>> -		cfg->host_caps |= MMC_MODE_4BIT;
>>> -		break;
>>> -	case 1:
>>> -		break;
>>> -	default:
>>> -		pr_err("invalid \"bus-width\" property, force to 1\n");
>>> -	}
>>> +	cfg->f_max = 52000000;
>>
>> cfg->f_max can be also removed?
>>
>> Best Regards,
>> Jaehoon Chung
> 
> I don't think because " max-frequency" is optional in device tree (only "reg" is required)
> 
> Here 52MHz is a default value when it is absent in device tree
> That avoids cfg->f_max = 0 after mmc_of_parse() call.
> 
>>
>>> +	mmc_of_parse(dev, cfg);
>>>
>>>  	upriv->mmc = &plat->mmc;
>>>
>>>
> 
> Patrick
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
