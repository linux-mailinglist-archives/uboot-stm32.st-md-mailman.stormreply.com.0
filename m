Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFF65D30D
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jan 2023 13:50:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86EB1C6905D;
	Wed,  4 Jan 2023 12:50:46 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B77F3C6905B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672836636; bh=NIcLtSrGBLXlEu4KrdkOBtj81sTlg1NukJV/luPbQAc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=iPWKbFAUe7e7rkrr4gcka8qnf72YvO+GJyHntjTfdGXFgnOO/KurwxHkCsoDwqQXh
 nS9JY6tw+C4/DHod5MLoMYQQWLtSMwF2W/T435O+OWpA5F6kv9FgO6iRqJN9C9ZcPX
 bmDQzc9HjE1nkWX3vkYygznfws7IWr2uhDAmpPxS5jY1ex7ioGXEHbflq7zoMcppvM
 GNepNbeGwXF5EgJkfU0OBN1MeSEiultF7Zt7YgGYzNRjhv8+K0VNtIZJAJ0jkp3o6R
 i7pVDg2qKj5tzh9sdjDOdMlLZo2wjqP4vrKzyb9QHjL/Qm9+L+pBFUXxjF/j8Gup6j
 LY9nchni+X0ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([88.152.145.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1owtql0DyJ-00v6D3; Wed, 04
 Jan 2023 13:50:36 +0100
Message-ID: <9a6fa7c3-7ff2-1530-f884-fad0e54da72f@gmx.de>
Date: Wed, 4 Jan 2023 13:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Alexander Graf <agraf@csgraf.de>
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-6-agraf@csgraf.de>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230103215004.22646-6-agraf@csgraf.de>
X-Provags-ID: V03:K1:LwjdPE4huN3WwW5PT8w+VL+LC9VgAxMDd1mf9Lzv/1bJQJHHoEp
 Q1ZFIG07zayPMWoYsugOWc2Ultti2030Lh4G4ENkZkDjpFkPwP9Q+TjFnP5F9OFR7BqqGPU
 EZjF41l25/HW58LJ7CTdaQYt9h5pIeP4bwImMtI8V7jLrCj1eK2jyqzvMCrKBN00M0McIqn
 Ql5lUU7IRCImnavVyOdDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MGZRjeo5Ntg=;8/5r8ZR6aNalrHychuBFEEyaYPa
 tv+2Hda2EP+QUeKm80X0qFrDblEv68Ort9feHLZIcnn2zYoYR5g5+3EMAflbp3alK8BlSdeN9
 YMEx5sL8Z742QeuQEw63320s7j7g4vGh1y+mJe934jFw0Vo9EKAV8C8VzMbi+BizPPi1Q0QCh
 sOM9XENZV/rlsEUa2Uk+LD2Yd50lyEL2gXxyEL7odUaFUhp8qpBcwqp2iHiXH9o+s2PpTCFSi
 h28HvdRQhywp1FFFG5v70zhxC+/nGB9IRiuV6K1obNoic0rHtDT7fKaz9zY+fu/PiXI3h6fxR
 EeciQAfUIa0QBIUcZSeH19qkTAbdzPaRQAX2geEXhgO8p+nsTKpAk4SQvPSCIDVCP4mMt0PwJ
 sMs8GDzQmLY9dWBpCkr+0obdeW7i5tUhyXWOE7fBBjcLKkPfYwf4F8XYkH7VhzjqwQCltnl/u
 TXIeR1laLL/kWmzlmLpedL/A7r1lmnjnNRHDN6HARhlQIZfplh5UjJwELlnzwaxDZBXWovRjb
 YsFbQ3yi5TC5Zg9oHaBkiUnzKFiuHi3XBk7X9WRhgoRnB/Rsx6YKcilmi/+EVDH2rO70oyMYW
 nR94IdFpZ3txPNIna2bG5vT+jnX9s3gKE7vU/5ZnW9vAizVj80gjEnPI3qlJJJmUFWYnCXpDQ
 7+gAXoBh1VgrHgY9YUsIM4tP0fTf6f4Hm9XJkUajdt3Q4nYkYgJZluOrJSypvUrZvKf1EnUq/
 NmTKBuLlFOUqKx2WWVHFWHMtIq66Tsxt0kCIYuR/zOMS3rB01CoMZRX+Q9bUnwr9i56PVHf/K
 53YifHPfnXeiiD+Jvp9oFJJNCx8MNy7lFm6S4dXN8K9Jvpm2+3l9FpY+7QXq534eVghQKDTVB
 gpQSDnnKFYQMdetB08jPkBeodhZsy6Xq824huD2loKO93+ShmXFAuodQ6RmsHOgxb6NhY0Lg9
 Q/et0ojwNZqxFVqCEAWuqBuPkgs=
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, u-boot@lists.denx.de,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot-amlogic@groups.io,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 5/9] efi_loader: GOP: Add damage
	notification on BLT
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

On 1/3/23 22:50, Alexander Graf wrote:
> Now that we have a damage tracking API, let's populate damage done by
> UEFI payloads when they BLT data onto the screen.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
>
> ---
>
> v1 -> v2:
>
>    - Remove ifdefs from gop
>
> v2 -> v3:
>
>    - Adapt to always assume DM is used
>
> v3 -> v4:
>
>    - Skip damage on EfiBltVideoToBltBuffer
> ---
>   lib/efi_loader/efi_gop.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/lib/efi_loader/efi_gop.c b/lib/efi_loader/efi_gop.c
> index d1dc2f22d0..425dcbf6b1 100644
> --- a/lib/efi_loader/efi_gop.c
> +++ b/lib/efi_loader/efi_gop.c
> @@ -32,6 +32,7 @@ struct efi_gop_obj {
>   	struct efi_gop ops;
>   	struct efi_gop_mode_info info;
>   	struct efi_gop_mode mode;
> +	struct udevice *vdev;
>   	/* Fields we only have access to during init */
>   	u32 bpix;
>   	void *fb;
> @@ -120,6 +121,7 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
>   	u32 *fb32 = gopobj->fb;
>   	u16 *fb16 = gopobj->fb;
>   	struct efi_gop_pixel *buffer = __builtin_assume_aligned(bufferp, 4);
> +	bool blt_to_video = (operation != EFI_BLT_VIDEO_TO_BLT_BUFFER);

Using a variable is not really necessary but it could make the code more
accessible to readers.

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

>
>   	if (delta) {
>   		/* Check for 4 byte alignment */
> @@ -243,6 +245,9 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
>   		dlineoff += dwidth;
>   	}
>
> +	if (blt_to_video)
> +		video_damage(gopobj->vdev, dx, dy, width, height);
> +
>   	return EFI_SUCCESS;
>   }
>
> @@ -547,6 +552,7 @@ efi_status_t efi_gop_register(void)
>   	gopobj->info.pixels_per_scanline = col;
>   	gopobj->bpix = bpix;
>   	gopobj->fb = fb;
> +	gopobj->vdev = vdev;
>
>   	return EFI_SUCCESS;
>   }

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
