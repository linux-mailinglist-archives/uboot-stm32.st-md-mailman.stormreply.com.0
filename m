Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 670042732F
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 02:18:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AFA9CC10A5
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 00:18:36 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3750CC10A2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 00:18:34 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j49so3766511otc.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 17:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g78eElmtuhsUE1gkhbHiDQPjU7QBkeH0F/s9BwaVlYQ=;
 b=F49rqd8UKE/N0rOP9JNdRckg1RsqoUHZ+s80aKeJee6pUeV25zBjzMopIwSOzd6701
 sxJmBcoHkcV0Q5dOVYkDQFwd1c0W5sQZjuRtdyFJEcbctB15/2v3epOK6jWgErYuZCch
 M50haoCPtqn7Sk2AM/ftlvpP+iHdz9scixKYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g78eElmtuhsUE1gkhbHiDQPjU7QBkeH0F/s9BwaVlYQ=;
 b=Ap9m/FrUav1ntBTqV5JrQd6Hahx8aAgOiBVzfDXBiAhAdrExFytPgCmvQ2IqYiXZIh
 ZmO+XwOunyYiNEaSb0RC2GWWUY9eVjsNLp/2OGMiFXfzcAv5cIyjJjNPLem9cZirzTwI
 kKsPwV+RKt+DkI0AryN9yXEHfoAzGbqYjXjw12wocSmrcwGufsGZ6abbzKC0UNFk+nYp
 Vw/YMkxjPftQsB0FxhWBFE2Xtqmp/J1q7VBlVvgyVzJGWBDBZTL+VHTuagaFmJacDNxc
 PydlK2Ml6Kyxtw42tRvS/7niKfDo0k2hbEKKGK4A3oP/ZRGbLbr+WSYp/T2021sYKEZg
 pzpA==
X-Gm-Message-State: APjAAAW9+iwkEOFRG09ivEMf112vlX2hy5DmeB5MSJJ5RQCHfxPbuurZ
 tutCuTIWnQWh51bJH3srzxYGpa/TWpjZWwGaKWc/RQ==
X-Google-Smtp-Source: APXvYqwJdPjyeEQP86sSrmwgANHEKgb/rx4E0JBJJ4EYdygdLSsAYxeG5uZmD2JnIHfmYCOm7+7RMjkYR6WRUyvRSr4=
X-Received: by 2002:a05:6830:1408:: with SMTP id
 v8mr1154794otp.48.1558570713131; 
 Wed, 22 May 2019 17:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
 <1558512409-32376-4-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1558512409-32376-4-git-send-email-fabien.dessenne@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 May 2019 18:18:21 -0600
Message-ID: <CAPnjgZ1H_idk67E8emLodR4msCdg4S_WZSD3sN_jKrumGv-Cnw@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 3/7] remoteproc: add da_to_pa ops
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

Hi Fabien,

On Wed, 22 May 2019 at 02:07, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>
> This patch introduces da_to_pa function to allow translation
> between device address (remote processor view) and physical
> address (main processor view).
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  include/remoteproc.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/remoteproc.h b/include/remoteproc.h
> index a59dba8..58df11a 100644
> --- a/include/remoteproc.h
> +++ b/include/remoteproc.h
> @@ -63,6 +63,8 @@ struct dm_rproc_uclass_pdata {
>   *             Return 0 on success, 1 if not running, -ve on others errors
>   * @ping:      Ping the remote device for basic communication check(optional)
>   *             Return 0 on success, 1 if not responding, -ve on other errors
> + * @da_to_pa:   Return translated physical address (device address different
> + *              from physical address)

How about device_addr_to_phys()?

Also please add a full function comment here and below. This uclass
header seems to be delinquent.

>   */
>  struct dm_rproc_ops {
>         int (*init)(struct udevice *dev);
> @@ -72,6 +74,7 @@ struct dm_rproc_ops {
>         int (*reset)(struct udevice *dev);
>         int (*is_running)(struct udevice *dev);
>         int (*ping)(struct udevice *dev);
> +       ulong (*da_to_pa)(struct udevice *dev, ulong da);
>  };
>
>  /* Accessor */
> --
> 2.7.4
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
