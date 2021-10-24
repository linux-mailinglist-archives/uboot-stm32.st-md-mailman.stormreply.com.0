Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB86438BB9
	for <lists+uboot-stm32@lfdr.de>; Sun, 24 Oct 2021 21:55:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB093C59781;
	Sun, 24 Oct 2021 19:54:59 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB2DC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Oct 2021 19:54:58 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u69so12700645oie.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Oct 2021 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pw/OrOBGIwJd6sXyhOaMQJ6jmqdvMDD5/SpUnxNMJls=;
 b=jhalRVeYrHQvBtShAJM0m7w1lP52vq3P8xbIhz7bBFugPa5R01gAZ6CazD2Wl7H9R2
 QzOQMjfOCmKuLlWJOQKa/V0Ey0XckPs6VoGhWcb7HMcc4ftf7olpiwvEyl4zJEk7SEvf
 CP/0Qzui7CN5bgyoitUzntsp7v1NwQtPF046c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pw/OrOBGIwJd6sXyhOaMQJ6jmqdvMDD5/SpUnxNMJls=;
 b=wgSfhwpbbi+v2xkkO6eDOQgfAmm0wRIP859roi09Dii90tC9Yb2sm7L9uHCFVG7f0I
 conmdoA9scbtd8LmaiXikIakWVKotnULEuzbM+IKwURrBpe5XpiJ/TaanwSqW7bcklFK
 2sZcNQXgxnVcJDViCm/k/0Lq4pCfFA9iEgMf7B33BXRNFZJUJKbltUw0wxWKiAPnaph4
 VuRBt72jUqTZKaxugxdsWR7ASvNv5ckekeum0uzCF3dh4x1o8QLTNXRpCc3vr/pXXEzs
 yyLT0kH1SKIkNotNTO9iBnrH0i35yvRfyOoGjnFE49TdEGemv+RYE4QupNkWiUDUMtBo
 xxtA==
X-Gm-Message-State: AOAM532tDW8LErVj0gwihe3B6sllgGdfhUWOdBB6ZUd/QAZ0xaGu5GPp
 aILdamprlaKEwelACzfLutXO5CcD6GwP78oXLeD3qw==
X-Google-Smtp-Source: ABdhPJyE2883vIUVNrm+PwUq8hHwZVVlQoQdagQgVBxUBPJcJPc5E7sUpl6TkBOcBTVPGClHOWvvBNsy80ZcKGg7z3g=
X-Received: by 2002:a05:6808:f07:: with SMTP id
 m7mr9114317oiw.150.1635105297282; 
 Sun, 24 Oct 2021 12:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211022170544.1.Ib218a8a747f99cab44c3fac6af649f17f003b2e2@changeid>
In-Reply-To: <20211022170544.1.Ib218a8a747f99cab44c3fac6af649f17f003b2e2@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 24 Oct 2021 13:54:06 -0600
Message-ID: <CAPnjgZ3rCCecWSd0iWnhG7ZiGuNKyDfofnK06w69OvHZ82M4fQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Torsten Duwe <duwe@suse.de>,
 Matthias Brugger <mbrugger@suse.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Uboot-stm32] [PATCH] lib: uuid: fix the test on RNG device
	presence
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

On Fri, 22 Oct 2021 at 09:05, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Correct the test on RNG device presence,when ret is equal to 0,
> before to call dm_rng_read function.
>
> Without this patch the RNG device is not used when present (when ret == 0)
> or a data abort occurs in dm_rng_read when CONFIG_DM_RNG is activated but
> the RNG device is not present in device tree (ret != 0 and devp = NULL).
>
> Fixes: 92fdad28cfdf ("lib: uuid: use RNG device if present")
> CC: Matthias Brugger <mbrugger@suse.com>
> CC: Torsten Duwe <duwe@suse.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  lib/uuid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

OMG


>
> diff --git a/lib/uuid.c b/lib/uuid.c
> index 67267c66a3..e4703dce2b 100644
> --- a/lib/uuid.c
> +++ b/lib/uuid.c
> @@ -257,7 +257,7 @@ void gen_rand_uuid(unsigned char *uuid_bin)
>
>         if (IS_ENABLED(CONFIG_DM_RNG)) {
>                 ret = uclass_get_device(UCLASS_RNG, 0, &devp);
> -               if (ret) {
> +               if (!ret) {
>                         ret = dm_rng_read(devp, &randv, sizeof(randv));
>                         if (ret < 0)
>                                 randv = 0;
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
