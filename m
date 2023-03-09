Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BDE6B2368
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Mar 2023 12:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39FB1C6A609;
	Thu,  9 Mar 2023 11:49:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AAD1C65042
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678362566; i=xypron.glpk@gmx.de;
 bh=ekZ4u+YBK5lBqaiBm9wCU9di4dsv9g5CAXJAGwvJUxE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aFMJm0yd7ry3thSJAUaCQg03P6UX90QMuOml2HDHdniGLMvR0FpIwQI8ljdn34u2K
 S/xACeC8Ug0WU1XVaN935UqcocQGiCoap6TPvBfpV1Qcss1r5JD6T4Cw8+4GBkLE7t
 HCnxFsoMnd2f8eYmxEq470Cy0rlO+W7+f4XiwvXgMkvG3/hiO+zirxyouqMottbvlA
 7x8yRyoPWX8iszetP2G2SqUXopEdRDr6HWA9DPpOZpubL626XQzEZ9xlKmz79PCk20
 asSFJtVk36V8386s/GiHr+hzzefEl5ULBPT2WqsX10eZ01Gc7roziTJoGCRFmZqNAZ
 RiCMovFeRfZfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([88.152.145.137]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1poaG230YG-00EKik; Thu, 09
 Mar 2023 12:49:26 +0100
Message-ID: <fbc2eabe-2b9b-f328-ed73-e353b6f46969@gmx.de>
Date: Thu, 9 Mar 2023 12:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
 <20230308142555.2.Ie4c0c26b9f9564443ab4eb36059d16195af15fe5@changeid>
 <26d224e8-ef95-1380-4909-2585e0a5295a@gmx.de>
 <506a41d6-0ee6-0d02-2ab8-5ba4ebce2b96@foss.st.com>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <506a41d6-0ee6-0d02-2ab8-5ba4ebce2b96@foss.st.com>
X-Provags-ID: V03:K1:VAO4n1Gbr8P9SZDra5V6V1aEQYjTOPe4SobBmWJWkJEhVMYYv73
 PNY1QAHxVvIGdQ6y8WY4hGIVkJLRNb91BWIPKqt9sStttmIRCMptok/J0eF9ddLud3ar+RN
 qG8oI3OUBuCK/aR2JYzwjEOPGUuy9wuAIeNeE8p/SpttuefrzRL4+gMpG7tmIBprYPP3r2/
 IXt0uKd3xmvII2qUdclOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2ulEIIarlTE=;oj5LWS739hNL3KPX44fXGclIThn
 evutM/qikaxfR7uSKyKV+cwpl0NBhhsqductMdf3WbVNzvlu5EMLqkf/4b31Mv3JD14r/f1+s
 j6XJHGzopRBF2zVwSTRTAYfM09uWkTIMX6IBm1ibMtH09LdeOyZ1zo+uaZ7QuIfvrx0tF7Vye
 YRJykqeq6EM9hYbEqoZWs580N+BKUxiBG8jguNDebzayohHhE3tc10R8lg5G5i7hCLyvLvjQC
 66qlhnsjULLaufg9DIkvoAyMOBI9PxEZywdtLXv6R9iH/Aroxqpt6Ihc2CxbBbA902B0dDWKR
 soJ6Kv3wMA9LC4j67bqtc9vBhPdX3PX471aG32OMYU7FUEU81J3YTczStWpRJQ5sgmHt9ksti
 ePdhroYR72WJ2eBfDugOFwh0azcKASd1JP7oDQ2l416i46uVTASz1bq9diWixUapKI6KSrmMP
 ot9JUhCcMcNBVO6BihKhX5Iblb4mw+S/TObI5w1HLzd84MwdUUibRpFHUUEXkIzgJcMoNV22l
 ThVVBJDLlT+Cpukmb8VaFMg+XK6a1L5i1RUhPY3xnzLuzJQS5b/EKl+qJYH5AGHUBaQ7zBwgQ
 mzN5AI77VCqWiRWjuEkW5nOkTA7vN5QFWm4BW3QzdpAn9tQbcgsJ9l8C+781xniD2z0NyUQ/A
 LSN12/AuPQySSSIkJtbfvqzO+SdRpwsiPX/f5BISxKKaE/2wHNM57nltX4eq4F6ivZa10SGLx
 APVFuzQ1OfP9Tew+5Hz40UARuJBKPrBd+remCD682o5LA8dvL/RVNHfxRirx43epm+Ao6p94m
 MrTnUe+LbFY3qhkb8bNW6MPTHUT2DPKNrH8l3fZ6sOWTqB9RxxbwhxWdYu9Xaem1cOSgVEkd/
 +foPu9ZPhCD6zrQ0hJh8JXOqe+UIN+CU4zqT3treFZ12sdktOe08RSWq68iil7uXLMd3HrHET
 ur9KTbGdn6w+I7UgLtyi8EPYCX4=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] efi: remove error in efi_disk_remove
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

On 3/9/23 11:59, Patrick DELAUNAY wrote:
>
> On 3/9/23 09:54, Heinrich Schuchardt wrote:
>> On 3/8/23 14:26, Patrick Delaunay wrote:
>>> EFI has no reason to block the driver remove when the associated EFI
>>> resources failed to be released.
>>>
>>> This patch avoids DM issue when an EFI resource can't be released,
>>> for example if this resource wasn't created, for duplicated device name
>>> (error EFI_ALREADY_STARTED).
>>>
>>> Without this patch, the U-Boot device tree is not updated for "usb stop"
>>> command because EFI stack can't free a resource; in usb_stop(), the
>>> remove operation is stopped on first device_remove() error, including a
>>> device_notify() error on any chil
>> The typical reason to return an error here is that the EFI device is
>> still in use, i.e. a protocol installed on the EFI handle is opened by a
>> child controller or driver. As long as the EFI handle cannot be removed
>> we must not remove the linked DM device or we corrupt our data model.
>>
>> Best regards
>>
>> Heinrich
>
>
> Ok
>
>
> I get it now,
>
> Forget my serie
>
>
> Patrick
>

Hello Patrick,

thanks a lot for pointing out the issues with non-unique device paths.

As it will take some time to clean up the device path generation patch 1
of the series may still make sense to avoid trouble for users using
multiple USB devices.

Best regards

Heinrich
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
