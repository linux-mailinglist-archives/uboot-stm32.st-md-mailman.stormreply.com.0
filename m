Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064B6B1EF9
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Mar 2023 09:54:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44A4EC6A609;
	Thu,  9 Mar 2023 08:54:38 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30DD0C6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678352073; i=xypron.glpk@gmx.de;
 bh=66YSM2e/gF7sTziVYynOO4XtbRMgBLoTVS11BCVPoyk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dPlWPiWmjvxA+wWBZxeZzRyOgKhvlehZDiMcH1ys4xHhVPhelXASPoT1PFJOYPNLR
 zZByRNFw9iaHhdk4LmYEr/zSpOfbXXAk6GjI4yPjeCwx0zCQsylZvb+F4mnHcc1K8X
 IhCdAtEK7dxEHFdBHeLz9UOQ73HMyVwBZ7t8crY0s1kcc/5qD1f/EetLMorct1FqRM
 Q/bM9u8xTtW6BFuZvgpcHWUSUAi+o2vjAhroNfxlz4lIz2NQnBkUripDvTyt77U7e+
 SzF62Ke5XzJFYND1BHKS7l7L4g40t2H23OAeiwKQNCU8jGQ4yKP6GMjdpd0TSGbmmk
 k2ekuD1xjL9jw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.67] ([88.152.145.137]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1qegVm3sLS-014hP8; Thu, 09
 Mar 2023 09:54:33 +0100
Message-ID: <26d224e8-ef95-1380-4909-2585e0a5295a@gmx.de>
Date: Thu, 9 Mar 2023 09:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
 <20230308142555.2.Ie4c0c26b9f9564443ab4eb36059d16195af15fe5@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230308142555.2.Ie4c0c26b9f9564443ab4eb36059d16195af15fe5@changeid>
X-Provags-ID: V03:K1:W+yajC0gbzspkMqYeHKsxsKASo6ztWKQiMHgdYBpH0SakltQv55
 VvrGIo7dVhpIwPysrJvv3pRqcbQWahJeTgeZMTt5auFPLBF43Sf3tbVE7L2VwFYezg9Tdi7
 DvuM23NM7kyQDG2RLWWnMxjRS/sGvTkgp4x9T2XUDgPbX5ckqg2dIw6baceP364YqHjRW2t
 IuY39pIYtPOX4c+WUo2cA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HpDjL5lycNc=;OJl9iOuF+C9ZYuBQeM+f5PsIzEe
 PISLyszwtbjZXN6kvwPR/KjIHw5DCp9XDIEWfaItyuaefMMsuoAEZ0iH8e5ttfte7GgwLaMx9
 lKF4xLP6vjLr3eUkpu6Skk8gDHmQDnMGSpKaM/Af7FoFNmigNjP//ToW0LDzmVpON8sjHscgD
 RzkNyUrSjXmQZKJxUNI+PeiV1vP4dzPLDlY4i+3w4zLORTWNehwP9bIFL58FsFBIirhxwmFwM
 vHLf2BKL42VDbRZKZ+D39r0QLWVQ4jXBp4zQXXfjFYhl0OTAyz4xlcRHOvUExkSnYjnZ2bcqv
 AqW2mjBskm+HBT0LDViOviHeVd62mCT5ul+VKNTrafx/IMFj2up2qlER4Un8ayjSnxuyLiS4u
 UtPeIxUYiQzx9iyl5aMo4AoC1vLrSX3ubtnwSCL2Uh3weiX977R8SwLpezKZlRisGNQpiC+t0
 S6Mi4cBP+COjH+co3HlfGZPcMh+U6bD6kIky9WQKe9jOu6knEKH0cnITIsVoceK59w2a8AuqC
 gMT4eHkRcs2KouLN98eiDtly6qfVkqjPBRIGOXN4f38xXPn6HTRLhDhGYNgsCFsD4qI5z3IcQ
 r6+rIGi7uf0qrIsNWNiIQZI3UryJ4iqbjxdfpnDjZRzS2eSCzi39DnJ05mKKCGjSBd89pk1qm
 A3eTQLLALdCtAtlf8N577GpcRI6x6jTAV3mqWS5t2kfiw9el4nsUUjz0P6wfQUkrKS1LT8dvg
 Okrnu3a71yq0Spam54YSJw0mcB21sT4QxdgvgpPP5yNkFIwYKZOSi8xCxCwrZYMF7iGjQ+o4u
 K5dwZdwQi3QWCoELfXVrdUp6nRejGs+GdGLUUXvyndJFvfqSWK6Bt7BlnXjU6ACsAK7ob+avB
 tjicecCLeL1E2B13MTR/J6JMMf3DHWfBnup3849JrIhqsBwvNX69qgQvuTHgR24sZpWZW7uAX
 1h/SF418M4rPK1K1WUpSOtftOWE=
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

On 3/8/23 14:26, Patrick Delaunay wrote:
> EFI has no reason to block the driver remove when the associated EFI
> resources failed to be released.
>
> This patch avoids DM issue when an EFI resource can't be released,
> for example if this resource wasn't created, for duplicated device name
> (error EFI_ALREADY_STARTED).
>
> Without this patch, the U-Boot device tree is not updated for "usb stop"
> command because EFI stack can't free a resource; in usb_stop(), the
> remove operation is stopped on first device_remove() error, including a
> device_notify() error on any chil
The typical reason to return an error here is that the EFI device is
still in use, i.e. a protocol installed on the EFI handle is opened by a
child controller or driver. As long as the EFI handle cannot be removed
we must not remove the linked DM device or we corrupt our data model.

Best regards

Heinrich

>
> And this remove error, returned by usb_stop(), is not managed in cmd/usb.c
> and the next "usb start" command cause a crash because all the USB devices
> need to be released before the next USB scan.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   lib/efi_loader/efi_disk.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
> index 8d53ba3bd27e..22a0035dcde2 100644
> --- a/lib/efi_loader/efi_disk.c
> +++ b/lib/efi_loader/efi_disk.c
> @@ -767,16 +767,20 @@ int efi_disk_remove(void *ctx, struct event *event)
>   {
>   	enum uclass_id id;
>   	struct udevice *dev;
> +	int ret = 0;
>
>   	dev = event->data.dm.dev;
>   	id = device_get_uclass_id(dev);
>
>   	if (id == UCLASS_BLK)
> -		return efi_disk_delete_raw(dev);
> +		ret = efi_disk_delete_raw(dev);
>   	else if (id == UCLASS_PARTITION)
> -		return efi_disk_delete_part(dev);
> -	else
> -		return 0;
> +		ret = efi_disk_delete_part(dev);
> +
> +	if (ret)
> +		log_err("%s failed for %s uclass %u (%d)\n", __func__, dev->name, id, ret);
> +
> +	return 0;
>   }
>
>   /**

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
