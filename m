Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C243E356
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 16:19:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2202C5E2B7;
	Thu, 28 Oct 2021 14:19:28 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9B9AC23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 14:19:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id m17so24436125edc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pMWOB/eqbzJAkRp12Hsh+fTUKXMv8vamJCqtIqiiQk=;
 b=fPXEITyqh1oKNnvr3dj+nAti5DJpSOt9B1jF79NTIVdZASLVISSR6IaQkHCrCnHHVk
 Q80Ff0MkFX//LcGpQAOfOZpf8ldVXTYE910UDmnv0EQJRyl50C9mzk+uRtkmi+7drBKZ
 NsZ6I8UqxGqrTzMkPOWjh5o7/vcd9+uJuF9JE67Nif8LuSwEXGRj4x/lG+dJqpa58FjT
 j3EDeWpV5JpLbaxIb59rw2rxP2WxCLVJTwWARxEG5S/ue0f/8rRBb+vTKHNumaXpoTMg
 dyeAMTnstWIOgWw8d0w0L6xPBvitbV8wQRD2UXTaBykqg8AUsaOgSAHfTcWr+LZj2ikr
 TZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pMWOB/eqbzJAkRp12Hsh+fTUKXMv8vamJCqtIqiiQk=;
 b=NfAH8wB5bIJUybZY9KrkJ9Ckf2hAoD9foe/u289IG/KLraOUmJYxHi2hZ2JIlhLbUI
 V+l8ZqBAX2wthkiwXQpp8zUW+x/CguV6FqbQDoCLyiFXgW1+ymEL33I3mXjvCRe+bAos
 eyaaJAuYU2H3bIO8o1Ht+Y5UJvkd1oGjOkmVZC0Kvq9P7wHytxvA5oxlBjg3MKFqNy6c
 MEViTevx9qIdyklQQJJt/z1oQlMIhp0pnbC9eZoCTPzgdEODcMrjm6tqKQr3gJmG5nw4
 7MQy6YNDGqKtvTas83BiLlDNe/FMcFPcEE5E5o0Zm31e+PFCKKVhjO1OuBcmKtGth1Pa
 SkNA==
X-Gm-Message-State: AOAM532Ilguh7Ec5JoQ1BiQ4dSkpRJ7lO7KyeTM4Oz4zWB+oL7FGG71A
 ToMxGOgorCO02WK00BQNrsXsLe0Y8WGcb58Z+MOnN8QusZeioQ==
X-Google-Smtp-Source: ABdhPJxEPCAqJM3wLi6tGk2wdp+1UT/eMn3nTtVFiLaTHtYYsOXKtjTPtRQnLbRsq6JLhJCFNEtizi3pWm4jd9aBWls=
X-Received: by 2002:a17:906:bfc9:: with SMTP id
 us9mr5616336ejb.161.1635430760305; 
 Thu, 28 Oct 2021 07:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211028150102.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
 <20211028150102.4.Ib2e58ee67f4d023823d8b5404332dc4d7e847277@changeid>
In-Reply-To: <20211028150102.4.Ib2e58ee67f4d023823d8b5404332dc4d7e847277@changeid>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 28 Oct 2021 16:18:57 +0200
Message-ID: <CAN5uoS-PC+wGx-CwnhS6dtbbpLaU5T8trO_ComFzVWdd2afBZA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/5] firmware: scmi: add configs to select
	the supported agents
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

Hello Patrick,

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
for the series with typo fixed in patch 4/5 (see below).


On Thu, 28 Oct 2021 at 15:01, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add two configs CONFIG_SCMI_AGENT_MAILBOX and CONFIG_SCMI_AGENT_SMCCC
> to select the supported agents as all the agents are not supported.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/firmware/scmi/Kconfig  | 16 ++++++++++++++++
>  drivers/firmware/scmi/Makefile |  4 ++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/scmi/Kconfig b/drivers/firmware/scmi/Kconfig
> index c3a109beac..db35438dda 100644
> --- a/drivers/firmware/scmi/Kconfig
> +++ b/drivers/firmware/scmi/Kconfig
> @@ -17,3 +17,19 @@ config SCMI_FIRMWARE
>           based on message exchange. Messages can be exchange over tranport
>           channels as a mailbox device or an Arm SMCCC service with some
>           piece of identified shared memory.
> +
> +config SCMI_AGENT_MAILBOX
> +       bool "Enable SCMI agent mailbox"
> +       depends on SCMI_FIRMWARE && DM_MAILBOX
> +       default y
> +       help
> +         Enable the SCMI communication channel based on mailbox
> +         for compatible "arm,scmi".
> +
> +config SCMI_AGENT_SMCCC
> +       bool "Enable SCMI agent SMCCC"
> +       depends on SCMI_FIRMWARE && ARM_SMCCC
> +       default y
> +       help
> +         Enable the SCMI communication channel based on Arm SMCCC service for
> +         compatibble "arm,scmi-smc".

s/compatibble/compatible/

regards,
etienne

> diff --git a/drivers/firmware/scmi/Makefile b/drivers/firmware/scmi/Makefile
> index 966475ec10..d6d6f89493 100644
> --- a/drivers/firmware/scmi/Makefile
> +++ b/drivers/firmware/scmi/Makefile
> @@ -1,5 +1,5 @@
>  obj-y  += scmi_agent-uclass.o
>  obj-y  += smt.o
> -obj-$(CONFIG_ARM_SMCCC)                += smccc_agent.o
> -obj-$(CONFIG_DM_MAILBOX)       += mailbox_agent.o
> +obj-$(SCMI_AGENT_SMCCC)                += smccc_agent.o
> +obj-$(SCMI_AGENT_MAILBOX)      += mailbox_agent.o
>  obj-$(CONFIG_SANDBOX)          += sandbox-scmi_agent.o sandbox-scmi_devices.o
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
