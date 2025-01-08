Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C3A06700
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2025 22:13:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2C6AC78F65;
	Wed,  8 Jan 2025 21:13:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDF39C78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1736370770; x=1736975570; i=xypron.glpk@gmx.de;
 bh=SbCAS7imgoPTrfc8zMmHxPNtHCGItasGIA2zJKmUi3w=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CwEkwUYmWFcy4PWTad5QHWful3Ciu9sexzpFHjdEFDsKGmXxUetwH6a2d9+l2Ekg
 qHLTWv5F6/PMxkMccdSrAVBqNdt1c6N3x4HjzxZyGCf3jnqa9BbBN+WDSQ/USIQws
 Fip1bJYCsT5aB9jt/DweIm1eUKR/BXPHRbiAC4+Aq2hAWbkmvdVL4ocPuPxp7P+xk
 MmrH7uciP1cnoWFZURF4XSiXSnw4h8ukkhre4qHL/tHfdoriIOfksqlsNqwGw3v8t
 ntsUArIZWyiytLTPIeEppQ+4PINeVL7/tFy5890NKhlKnZcJ2YbwhYl7c+7jkINXQ
 wCB3UFxyCar5MpVgag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([5.147.80.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1tmTU80KtW-0144O9; Wed, 08
 Jan 2025 22:12:50 +0100
Date: Wed, 08 Jan 2025 22:12:48 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
User-Agent: Thunderbird for Android
In-Reply-To: <f4b3ff28-5c7a-4ca2-9dfe-ab3c7d64f50c@foss.st.com>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-7-patrice.chotard@foss.st.com>
 <f4b3ff28-5c7a-4ca2-9dfe-ab3c7d64f50c@foss.st.com>
Message-ID: <55CAF1B8-3A17-4486-979F-AA71BFB85670@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IKHOOuToHaHxQc4hJ7kEBGpzeLnW4zlTICahZIY7rqK+Cod0KsK
 6fResDNZbpvBCUaK5lMWlIGf1ezdOPQseNFg0EQFCRLNeYwxgY5LMxMua/lEYDHIeahlKMb
 9+e20t6llzbGYGoyF2oSkgw1gI8wzlfPT1vPon0hsti3JB8joC37W7NqkO7NFUJUCzzICZx
 QSs66zmuaEt06KX7VS4lQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jXllM3pE4qE=;xVWH7CF2iPn8Bz/BTg0Oywa9bRi
 MdaCkTOcISvlEtPpwf4k+oFHor7Xa55sCkCuZQVCIiPIJxFti9qm7lKPaKrNSf5UrxmxtZpsq
 bUqugNBIYTnYs+lxF4utv/ySlTOiH0AJPG6CGoDo072TlL78crRn+09cSp2xg3sKieaceHJ1K
 Hc5iV8bp1QtGEiiz05fjzOMAnPjWYQxHj5GQb5gq9QKQ4DblV7GmQqDURpHD5ZdoD7oK3DU9q
 zoa2jV5ijyxbXT63AR84G5i4Cy5oNj+R1VaKYoDgdh/9Vp+BKUTlVMTQU0i2K+LVJ+CcEV16E
 80tDjT9SY++8gobvMhneJ9oU0GlGmOYnilobsoF8ohT66GVrF1SjgnIvfFOy0s6e7Blf9Lrb5
 PSIr+kx3GwT3vGyG63ieGhBkjNv7iv3Q2kPAeBzhslK3RfZcs6ePyAe5AKvAAcPi19xowBy/t
 PVxePb/s3W7Uc+9kTXpfR8i2EURd16RiA0Ia5imH7A9yUnsnQjsEl+b3X96QvZa4GdJxROFAI
 LM7Tyl7QxrkAnC6CwL1orvWtxf0MIQdZQzfCM6pZNVydod2i5s09LGXZqokJMkAK+AW3mjtWu
 F0fC6AK7uJD4vvhnAi6Oyni8g+alJc+4gCdmFfRRBzz/yTg4YRhm6rNI4QLQZTiYc1TJ8J5Ao
 8UTAV69JvS7/uqW9uW/WP3uEn9jr3vh6UyOMbAtXYALwDY7aNwgbF8BiXgB4OIuIkrGfLR41x
 atXBvWaXnsNOi49xsvhS2bnKEkDN/uF/HLJIYFx6Mng0hqaH27TLTEbn20/cxUhbvplPcBq7Z
 SclK8w5GKH+3vn/TV79u4wWy56HlIDGExXQfbT2iQMZUBwVU/6MFW2hJaqn2p9PMM2JbcsHJk
 r0y27KaHoi6XfEc+8PPv1T60FSle5ClNYd+ws/S3iAYtRLViIvlUgfrwtD1QjKaJFJAmM+2bx
 GewmvueZIwCsSNUt8irjhFElfaxjQsxBJ1WPAbz4N0+MoQ2Ru8tHyfx82quvRiqmeF+86w1uk
 DosN39fhQPmxWq5vZbnxbfVliOolNvcj0I++dKbxTJCrnDPaE+zbC6cFfrlE/le0HmNpJLpET
 UnxA7YuwzFcMFP7XrcpxBoN/hIANco
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v1 6/6] configs: stm32mp25: enable
	CONFIG_SYS_64BIT_LBA
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

Am 8. Januar 2025 19:50:07 MEZ schrieb Patrick DELAUNAY <patrick.delaunay@foss.st.com>:
>Hi,
>
>On 11/29/24 13:27, Patrice Chotard wrote:
>> In arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c, in init_device(),
>> in case of RAW_IMAGE, part->size = block_dev->lba * block_dev->blksz.
>> 
>>    _ part->size is declared as u64.
>>    _ block_dev->lba is declared as lbaint_t which is uint64_t
>>      if CONFIG_SYS_64BIT_LBA is enable, otherwise ulong.
>>    _ block_dev->blksz is declared as unsigned long.
>> 
>> For example, in case block_dev->lba = 0x1dacc00, block_dev->blksz = 0x200
>> then part->size 0x5980000 which is incorrect as both are declared as ulong.
>> 
>> To fix this overflow issue, enable CONFIG_SYS_64BIT_LBA, block_dev->lba is
>> then declared as uint64_t and part->size get the correct value 0x3b5980000.
>> 
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> 
>>   configs/stm32mp25_defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
>> index d3f0c088157..073172c3804 100644
>> --- a/configs/stm32mp25_defconfig
>> +++ b/configs/stm32mp25_defconfig
>> @@ -33,6 +33,7 @@ CONFIG_CMD_REGULATOR=y
>>   CONFIG_CMD_LOG=y
>>   CONFIG_OF_LIVE=y
>>   CONFIG_NO_NET=y
>> +CONFIG_SYS_64BIT_LBA=y

I wonder why we have to set this in individual defconfigs. Shouldn't this value be the global default?

Best regards

Heinrich

>>   CONFIG_GPIO_HOG=y
>>   CONFIG_DM_I2C=y
>>   CONFIG_SYS_I2C_STM32F7=y
>
>
>
>Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>
>Thanks
>Patrick
>
>
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
