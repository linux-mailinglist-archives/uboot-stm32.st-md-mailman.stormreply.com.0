Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CD47EF14
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Dec 2021 14:17:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD04C5EC47;
	Fri, 24 Dec 2021 13:17:38 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 028E2C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Dec 2021 13:17:36 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id 30so15094054uag.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Dec 2021 05:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8f2j4PwyJvsFVvQOf19Y39tX6JEL1Y3/BnDiJuXOeQ=;
 b=gB0mIl8M5nGID3uKw8sZT4NGN58yF3HxKBZ0r+74n1h6El5Of38d/nuo8uSTkRYjr6
 /DBfVr6DN9HKwnKQORRCp72zxPc0clLyHY0OpyPF9UEAH7pf7hXusA9gxrIpHFs4JlRV
 tueVPXlWNR5KJIEynb2yuWKcKMzUGSbJU1U/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8f2j4PwyJvsFVvQOf19Y39tX6JEL1Y3/BnDiJuXOeQ=;
 b=5ZM/ju3jp9H8ex7zsx79VElhIHSQ+JSbcrlxtS9pJ7OuOQHxPS9/ltMWzyqgchNbHA
 VhcMEt++eWGd6FbSB8a67jtLX1osCIWGDxmMUIHGy7Z2qc3+E0VX3bQFW9z8eyonzfJB
 b0a85TfrXZwC/2AqEI2x/LApXyVEI9Pyd3n8Nq0dD0+HSKPZHmORPoSEzDK23a56/YpA
 x4T7h4ckcUL2hzBum3vKYxZicru7XKFYjnAbxLTk58S3PQq6q/WUJT5cfHOLkaSI0MZL
 xPe0Ssdg+eZJuHEd9Jmu6gXh/yftkGOWuu5AytAjAIrMfYW9Cfa6SUlImyWxXieylmAz
 sytQ==
X-Gm-Message-State: AOAM533kZXinkvuODBEHFGSr3/SdvcyZVLqioXVTktMHK1wTi7giHJo7
 KZ0AKT6W+mixEupkmvfqUUIJn3J7fZZfZeZm6HcBqw==
X-Google-Smtp-Source: ABdhPJzhKh+giwQWY8Bad+cxxe/L5GaRL6W6BONk6X6qTjTPfHcKgwTK2dZ/TUPIJWQKpz/Nsi1FtUKGTG/ujosikhI=
X-Received: by 2002:a05:6102:b04:: with SMTP id
 b4mr2038943vst.61.1640351855612; 
 Fri, 24 Dec 2021 05:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20211223160932.4311-1-patrice.chotard@foss.st.com>
In-Reply-To: <20211223160932.4311-1-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 24 Dec 2021 06:17:23 -0700
Message-ID: <CAPnjgZ2OXYP4cM8aDq4tELguZKohjwhYmgZ6ogEp0LgezyowkA@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: Fix OF_BAD_ADDR definition
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

Hi Patrice,

On Thu, 23 Dec 2021 at 09:09, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> When OF_LIVE flag is enabled on a 64 bits platform, there is an
> issue when dev_read_addr() is called and need to perform an address
> translation using __of_translate_address().
>
> In case of error, __of_translate_address() return value is OF_BAD_ADDR
> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
> which is defined as (-1U) = 0xffffffff.
> In this case the comparison is always false.
>
> To fix this issue, define OF_BAD_ADDR to FDT_ADDR_T_NONE.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  include/dm/of.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Would it be better to define FDT_ADDR_T_NONE as something like ((ulong)(-1)) ?
>
> diff --git a/include/dm/of.h b/include/dm/of.h
> index 5cb6f44a6c..0208cc234a 100644
> --- a/include/dm/of.h
> +++ b/include/dm/of.h
> @@ -95,7 +95,7 @@ static inline bool of_live_active(void)
>         return gd_of_root() != NULL;
>  }
>
> -#define OF_BAD_ADDR    ((u64)-1)
> +#define OF_BAD_ADDR    FDT_ADDR_T_NONE
>
>  static inline const char *of_node_full_name(const struct device_node *np)
>  {
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
