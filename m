Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53839922B
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 20:06:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBBEC57196;
	Wed,  2 Jun 2021 18:06:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A080DC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622657192;
 bh=y72dMxlnW8Nc8QxzVmwHsyz/MFmmmyu0Xu5aq8qkq/g=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Ael0st9MvXOx/kefPdv1KjeL5shYxarPIWbm8VVS0nlC6nJndVlq9NNT/2M0oTKDb
 GRST3TDxrzFOaYArPkG78O4+LPO+Dlk9gBajkvMYSeoBRyzJS3cZq0GFufd5txazKC
 24lbXoTMe2WPCdy8Vco5YYpGIdeuyZoRps+yvDq0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1lELUp2xAx-00aCTL; Wed, 02
 Jun 2021 20:06:32 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210602155241.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <a5830e26-8114-622e-0d62-832464c2a3da@gmx.de>
Date: Wed, 2 Jun 2021 20:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602155241.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:oJsRn79EP0VJmjCYc0Lk6dB7UWVyfXwfk2mRlmJKwVcQlWl6//Z
 bdC+6SUXDY1voE2TOBTUd4qv4EdQcTNZsr9d2x1zLzO92rO6jTCD5mPxWryBQvNI0yCQ3+N
 o4VZpHOQXxrnO/LBBVBJ3maCKLxXnmjfHJH80msMPfinXWLgkh2klmhHcb8FpcF3cwajeSU
 NTVmfW0HdGhWCwGZRE0Fw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nLcntlVaJ9g=:E5bD8WNPhB7fZY3pp39Aet
 P6lavK0I5Cpfa9pCU9F4F1kiNXE1jFqp/g3gF62wb0TvryYPwrz8Yp12WuzYIlM6wAe0x7ehM
 z92cBX/wePbBl8T/mu0yNA3/VXdPpUK1YgFZSjOZDSNUtgkN2Pgzu1UM0st8Z4nGGedM21KUR
 eoyP6EHJcloRUgiLIUvA+dgX6gFN0HbH5enccR6UFbQb9tJ20NYIQ5Jo2bHiaMAd9Bf2D9C2Q
 JSAxjtZrznYRsMGwl7T5g3OEjCCrq1Xv2ZRftbRuqCX6TVhBJfUSEv4ZAHwBKEct685sAAa+2
 Xcbp5DU8SFWSaqK0VdLtcQ46XQ/IAOhp9tf40mB5D6HzjTSF25z0JSnge5J8RRGh8Q8t9m6Im
 xDBZPH4DRBViORoEsSTgutfIZR9MZTPg8kIpGUgW+FV0vylsDDpHzkSqj6PVCdal0tzdF8RZK
 rcu+dN4ua7xoiEYoAdx6v7GBqwtmMsIM8zL2pEO8vybqDYQSbEx/2rtqTW8L3+hzT7RaITd4A
 lU64ZpM3uHQ763r+CLRjU9wSDLjvZenAeVJqntZw1lha8ES7+f1DHFbUUyAHsSgdbx7obHanu
 TlhTtQoUtrAP9CKrNziCEQ9U5vQPbHHEwpLwdiaQH4HJqHH8ZuiPpZHHxlvTS623gY9osA6NH
 ME91T/WAEyF5JHkAj4n7xtdbc0GX0UEnUp33GrcEDGPWlXqWj5WCGXQGb7AOZS3YQJibIobc+
 0UT8LJvv6tV+eU23OAAY1PJmHjqqZzFG9GB8jYyfOe0pNCfkUT2Wla6gTEQ1qxsatRJ+eJb8H
 2mRaizgeTrAUa5jcz6xn66eZ2RYJM7vL6nU2pAQLlkIL/DtKoB4yZdNGqTbzEUOaYo41jjH3z
 nPWLC7b4c0/T2NzPk2dWTDQLVQNzij31PoQYLZUSAfkyE6IMjPxCBt22HgNPkaMHC3LjTmzJt
 TSoGDKU49z+0koF0JuGj5JGnboDfI/axFtcFuDj0htD/CsWOFof07x3UwnXqxvToD2AnaEf2U
 q1uUsPuhuUxIQHO2v2IMQNc2Fj0jj6iH6kohhKWzYDp9iLLN0/nvt0Tp4EAXGMQ8PvW+HhmXL
 7KdGrP96THX1le6+aBI4Z4O/pClDRPb4zQW
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: usage: man-page for ums command
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

On 6/2/21 3:52 PM, Patrick Delaunay wrote:
> Provide a man-page for the ums command for USB Mass Storage.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   doc/usage/index.rst |  1 +
>   doc/usage/ums.rst   | 54 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 doc/usage/ums.rst
>
> diff --git a/doc/usage/index.rst b/doc/usage/index.rst
> index 41b247bc62..1bab6ae3e9 100644
> --- a/doc/usage/index.rst
> +++ b/doc/usage/index.rst
> @@ -43,3 +43,4 @@ Shell commands
>      scp03
>      size
>      true
> +   ums
> diff --git a/doc/usage/ums.rst b/doc/usage/ums.rst
> new file mode 100644
> index 0000000000..cf0e3a9479
> --- /dev/null
> +++ b/doc/usage/ums.rst
> @@ -0,0 +1,54 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +ums command
> +===========
> +
> +Synopsis
> +--------
> +
> +::
> +
> +    <USB_controller> [<devtype>] <dev[:part]>
> +
> +Description
> +-----------
> +
> +Use the USB Mass Storage class (also known as USB MSC or UMS) to make
> +accessible a block device (based on UCLASS_BLK) to a host computing device and
> +to enable file transfers between the host and the U-Boot device.

Thank you for writing this man-page.

Unfortunately it is still unclear to me how to use it. Is this related
to USB OTG? What requirements have to be met to use the command?

> +
> +This command "ums" stays in the USB's treatment loop until user enters Ctrl-C.
> +
> +USB_controller
> +    USB device number
> +
> +devtype
> +    block device interface, defaults to "mmc"
> +
> +dev
> +    device number for devtype
> +
> +part
> +    partition number, defaults to 0 (first partition)
> +
> +Example
> +-------
> +
> +::
> +
> +    => ums 0 mmc 0
> +    => ums 0 usb 1:2
> +
> +Configuration
> +-------------
> +
> +The ums command is only available if CONFIG_CMD_USB_MASS_STORAGE=y.

The symbol does not even depend on USB and mass storage being enabled. I
would have expected CONFIG_USB_GADGET and CONFIG_BLK as requirements.
Either this description or cmd/Kconfig is wrong. I suggest both to be
updated.

Best regards

Heinrich

> +
> +Return value
> +------------
> +
> +The return value $? is set to 0 (true) when the USB stack was successfully
> +started and interrupted Ctrl-C or after USB cable detection issue
> +(timeout or cable removal).
> +
> +If an error occurs, the return value $? is set to 1 (false).
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
