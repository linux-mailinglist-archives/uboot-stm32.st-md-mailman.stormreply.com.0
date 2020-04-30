Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8231BF435
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 11:32:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA92C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 09:32:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC109C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1588239127;
 bh=Rwq6zS0HgAm/wzbFY8WP6ReV1AT/SNlviJOI5J3uqVc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Fy3WAMEXG7FFqLeAFk5eL4w0G0DFoy+96GnNBauelIBi3/LJ8rphHGXU+ndOpVRsn
 83mLRYdEP2fAjcWH/G6tjcWwXH0XeYhzCC4GgONyjk6hS6pctax6kcMcACWBfb8FCK
 w6Pp6ShYlp8Rjlc1eZLQD+EQRncUX/ftgpHVduKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.76] ([84.119.33.226]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCOK-1jrF8E3EPc-00N6h9; Thu, 30
 Apr 2020 11:32:06 +0200
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <20200430085226.19349-1-patrice.chotard@st.com>
 <20200430085226.19349-6-patrice.chotard@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 mQINBE2g3goBEACaikqtClH8OarLlauqv9d9CPndgghjEmi3vvPZJi4jvgrhmIUKwl7q79wG
 IATxJ1UOXIGgriwoBwoHdooOK33QNy4hkjiNFNrtcaNT7uig+BG0g40AxSwVZ/OLmSFyEioO
 BmRqz1Zdo+AQ5RzHpu49ULlppgdSUYMYote8VPsRcE4Z8My/LLKmd7lvCn1kvcTGcOS1hyUC
 4tMvfuloIehHX3tbcbw5UcQkg4IDh4l8XUc7lt2mdiyJwJoouyqezO3TJpkmkayS3L7o7dB5
 AkUwntyY82tE6BU4quRVF6WJ8GH5gNn4y5m3TMDl135w27IIDd9Hv4Y5ycK5sEL3N+mjaWlk
 2Sf6j1AOy3KNMHusXLgivPO8YKcL9GqtKRENpy7n+qWrvyHA9xV2QQiUDF13z85Sgy4Xi307
 ex0GGrIo54EJXZBvwIDkufRyN9y0Ql7AdPyefOTDsGq5U4XTxh6xfsEXLESMDKQMiVMI74Ec
 cPYL8blzdkQc1MZJccU+zAr6yERkUwo1or14GC2WPGJh0y/Ym9L0FhXVkq9e1gnXjpF3QIJh
 wqVkPm4Two93mAL+929ypFr48OIsN7j1NaNAy6TkteIoNUi09winG0tqU5+U944cBMleRQOa
 dw+zQK0DahH4MGQIU0EVos7lVjFetxPjoKJE9SPl/TCSc+e0RwARAQABtChIZWlucmljaCBT
 Y2h1Y2hhcmR0IDx4eXByb24uZ2xwa0BnbXguZGU+iQI4BBMBAgAiAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAUCVAqnzgAKCRDEgdu8LAUaxP7AD/9Zwx3SnmrLLc3CqEIcOJP3FMrW
 gLNi5flG4A/WD9mnQAX+6DEpY6AxIagz6Yx8sZF7HUcn1ByDyZPBn8lHk1+ZaWNAD0LDScGi
 Ch5nopbJrpFGDSVnMWUNJJBiVZW7reERpzCJy+8dAxhxCQJLgHHAqPaspGtO7XjRBF6oBQZk
 oJlqbBRFkTcgOI8sDsSpnsfSItZptoaqqm+lZpMCrB5s8x7dsuMEFaRR/4bq1efh8lSq3Kbf
 eSY59MWh49zExRgAb0pwON5SE1X9C84T2hx51QDiWW/G/HvJF2vxF8hCS7RSx0fn/EbPWkM6
 m+O1SncMaA43lx1TvRfPmYhxryncIWcez+YbvH/VqoLtxvz3r3OTH/WEA5J7mu5U1m2lUGNC
 cFN1bDsNoGhdlFZvG/LJJlBClWBWYHqHnnGEqEQJrlie9goBcS8YFUcfqKYpdmp5/F03qigY
 PmrE3ndBFnaOlOT7REEi8t3gmxpriTtGpKytFuwXNty1yK2kMiLRnQKWN7WgK70pbFFO4tyB
 vIhDeXhFmx6pyZHlXjsgbV3H4QbqazqxYOQlfHbkRpUJczuyPGosFe5zH+9eFvqDWYw2qdH+
 b0Nt1r12vFC4Mmj5szi40z3rQrt+bFSfhT+wvW9kZuBB5xEFkTTzWSFZbDTUrdPpn2DjYePS
 sEHKTUhgl7kCDQRNoN4KARAA6WWIVTqFecZHTUXeOfeKYugUwysKBOp8E3WTksnv0zDyLS5T
 ImLI3y9XgAFkiGuKxrJRarDbw8AjLn6SCJSQr4JN+zMu0MSJJ+88v5sreQO/KRzkti+GCQBK
 YR5bpqY520C7EkKr77KHvto9MDvPVMKdfyFHDslloLEYY1HxdFPjOuiMs656pKr2d5P4C8+V
 iAeQlUOFlISaenNe9XRDaO4vMdNy65Xrvdbm3cW2OWCx/LDzMI6abR6qCJFAH9aXoat1voAc
 uoZ5F5NSaXul3RxRE9K+oWv4UbXhVD242iPnPMqdml6hAPYiNW0dlF3f68tFSVbpqusMXfiY
 cxkNECkhGwNlh/XcRDdb+AfpVfhYtRseZ0jEYdXLpUbq1SyYxxkDEvquncz2J9urvTyyXwsO
 QCNZ0oV7UFXf/3pTB7sAcCiAiZPycF4KFS4b7gYo9wBROu82B9aYSCQZnJFxX1tlbvvzTgc+
 ecdQZui+LF/VsDPYdj2ggpgxVsZX5JU+5KGDObBZC7ahOi8Jdy0ondqSRwSczGXYzMsnFkDH
 hKGJaxDcUUw4q+QQuzuAIZZ197lnKJJv3Vd4N0zfxrB0krOcMqyMstvjqCnK/Vn4iOHUiBgA
 OmtIhygAsO4TkFwqVwIpC+cj2uw/ptN6EiKWzXOWsLfHkAE+D24WCtVw9r8AEQEAAYkCHwQY
 AQIACQIbDAUCVAqoNwAKCRDEgdu8LAUaxIkbD/wMTA8n8wgthSkPvhTeL13cO5/C3/EbejQU
 IJOS68I2stnC1ty1FyXwAygixxt3GE+3BlBVNN61dVS9SA498iO0ApxPsy4Q7vvQsF7DuJsC
 PdZzP/LZRySUMif3qAmIvom8fkq/BnyHhfyZ4XOl1HMr8pMIf6/eCBdgIvxfdOz79BeBBJzr
 qFlNpxVP8xrHiEjZxU965sNtDSD/1/9w82Wn3VkVisNP2MpUhowyHqdeOv2uoG6sUftmkXZ8
 RMo+PY/iEIFjNXw1ufHDLRaHihWLkXW3+bS7agEkXo0T3u1qlFTI6xn8maR9Z0eUAjxtO6qV
 lGF58XeVhfunbQH8Kn+UlWgqcMJwBYgM69c65Dp2RCV7Tql+vMsuk4MT65+Lwm88Adnn6ppQ
 S2YmNgDtlNem1Sx3JgCvjq1NowW7q3B+28Onyy2fF0Xq6Kyjx7msPj3XtDZQnhknBwA7mqSZ
 DDw0aNy1mlCv6KmJBRENfOIZBFUqXCtODPvO5TcduJV/5XuxbTR/33Zj7ez2uZkOEuTs/pPN
 oKMATC28qfg0qM59YjDrrkdXi/+iDe7qCX93XxdIxpA5YM/ZiqgwziJX8ZOKV7UDV+Ph5KwF
 lTPJMPdQZYXDOt5DjG5l5j0cQWqE05QtYR/V6g8un6V2PqOs9WzaT/RB12YFcaeWlusa8Iqs Eg==
Message-ID: <286308d8-8229-f2ec-8ab5-e0ac33786022@gmx.de>
Date: Thu, 30 Apr 2020 11:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430085226.19349-6-patrice.chotard@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:DFuJxgVDA9RH0ZDbXntbu0L/KzRqKvwNzwbS0RPMZVAvS/jCz/u
 +M1+dJZQcdmovDvYBUN7diWyyj654KZiqcTib7wZHdfn9LoDqys0qkHZx0/lLQWanK0QH8q
 wkPoozZAMw45nEk19pkJqj0Dk0CY1JdW9hx3Y9fhEtV47qYLHp/OUG50B/Tw9p6y2gOTFEh
 aKMhXO38eZDAHH9QR4kBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gxvu791Gr5c=:h9zXUORbY9EPRiKeSg7K/i
 zGUPDAA7HpQ/De+83crXqQUor+0cceGfaTf3BTIm8NV5dzY9JlvtAvaH1+DeCFDixyUyWPG3x
 8FzdfxktnJt2TCYqd7fPjvTtxIf7NSbu8Z0uPv5aevsTuAa/q5YEErtRKOLtZ28GEeWeN3M1X
 g7fS0QsjKmoNPdo0JW8td1eCmzMLdkEmcHIyi6tAeReuh2aNXmhcq25u5Bq5i1NFC4i/myN/d
 IUQbxOKc9R/Qwy4ekzaRlbJBmttlJv7bBHQ0zi3ZqEIHR23uiS87eaCrO2cgFX/9EBssI/Vk7
 hq1MaDqZxqQYANhJcHAAoGfHzL+aDVNMcqbw1SwY2IcXYZCb3LJbdAbnBcO4tmS2/eebpkC/G
 QDFv36smHxG2myAIz9Jqv5LlXltc+Q6qNEfb/Oz6KCW+G/zez5/BCFHfa0TFtap4srC53yIkQ
 276v/GM0w2LocgnP0CnQ7gviKK2cFqkG5vJ6txhTiLxDmBAM50/TliW7inBLf3KVMC83PwG7n
 zgpbFZwSkM0NTrskM57Bd4y7F69Zsz8pePQZGngSQdcljsKjOTCK/qboRFStOeU1hXZgsV/z+
 TLu/e7D0/+XMjR8FTiB9aklnN6YK72jGKI4meGu2OTGOyL4SXMpGc7YLU55rYBp5L9zfWYTxP
 BV6o+dbwFxpuTKg9ytcvyLCCEZvTZhF0XzhOGcIBhZJKitg12Fa/GUJLxeXXws95DKyFakDzz
 2jjSdDuvR3raav9hhfDygoU1EdQujhplRxodeBzUpAOidHyxlxIJQAzd4LVQjdznJV/7AYs+N
 nFji542aXhKZrUQ/PGCMBvUPYpuDWZehiAvgDZR+GsdEANpl5yfRIpgzxjV8KxlugSQ+wAdfT
 YtLzAMHa3KP1KbOG0nSbzNDggcshQXxi32sWYKjX0DCrRNsv4/Fq6hPUvVoWCzFLh/oXH+IBL
 mVB+yRFi3yMjru1PaRqgRjRj4i/bHwe88w5IczAEMSuMRiI7jnAom6+gbMtvLhn0X0qqVtNcv
 VeBaeDDn4WQMHuzbe59Iu7aE2yKW45lYzjWE4amTwoEDt74dPzFI1ZxWhZfab3zUvmAV5zG2W
 qTipl8kyh5FlsoAp4ire9JOGvnogDqi21d7a1LRZh6vx9/o7a4RXadVQM7Ryyj9aKut0+baCs
 H68ppIF744HCZXOlPwYPmER75VaUDETydL3DQ6zLAEKBv43GzdoUkB26v1uVmfwlwGJhX1EbW
 ro4vv1cz6XDDS6BQc
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 5/5] doc: add bind/unbind command
	documentation
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

On 30.04.20 10:52, Patrice Chotard wrote:
> Add documentation in doc/drivel-model for the bind/unbind command.
> Part of this documentation is extracted from original patch commit
> message:
> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v3:
>  - fix typo
>  - add bind/unbind parameters description and how to find them
>
> Changes in v2: None
>
>  doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
>  doc/driver-model/index.rst |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 doc/driver-model/bind.rst
>
> diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
> new file mode 100644
> index 0000000000..dfe8fd57dd
> --- /dev/null
> +++ b/doc/driver-model/bind.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
> +
> +Binding/unbinding a driver
> +=========================

The title underline is too short.

Please, use 'make htmldocs' for testing.

Best regards

Heinrich

> +
> +This document aims to describe the bind and unbind commands.
> +
> +For debugging purpose, it should be useful to bind or unbind a driver from
> +the U-boot command line.
> +
> +The unbind command calls the remove device driver callback and unbind the
> +device from its driver.
> +
> +The bind command binds a device to its driver.
> +
> +In some cases it can be useful to be able to bind a device to a driver from
> +the command line.
> +The obvious example is for versatile devices such as USB gadget.
> +Another use case is when the devices are not yet ready at startup and
> +require some setup before the drivers are bound (ex: FPGA which bitsream is
> +fetched from a mass storage or ethernet)
> +
> +usage:
> +
> +bind <node path> <driver>
> +bind <class> <index> <driver>
> +
> +unbind <node path>
> +unbind <class> <index>
> +unbind <class> <index> <driver>
> +
> +Where:
> + - <node path> is the node's device tree path
> + - <class> is one of the class available in the list given by the "dm uclass"
> +   command or first column of "dm tree" command.
> + - <index> is the index of the parent's node (second column of "dm tree" output).
> + - <driver> is the driver name to bind given by the "dm drivers" command or the by
> +   the fourth column of "dm tree" output.
> +
> +example:
> +
> +bind usb_dev_generic 0 usb_ether
> +unbind usb_dev_generic 0 usb_ether
> +or
> +unbind eth 1
> +
> +bind /ocp/omap_dwc3@48380000/usb@48390000 usb_ether
> +unbind /ocp/omap_dwc3@48380000/usb@48390000
> diff --git a/doc/driver-model/index.rst b/doc/driver-model/index.rst
> index b9df221627..37ef3721df 100644
> --- a/doc/driver-model/index.rst
> +++ b/doc/driver-model/index.rst
> @@ -6,6 +6,7 @@ Driver Model
>  .. toctree::
>     :maxdepth: 2
>
> +   bind
>     debugging
>     design
>     ethernet
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
