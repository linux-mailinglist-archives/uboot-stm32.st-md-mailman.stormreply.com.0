Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7E60FBCA
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Oct 2022 17:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EFF7C03FDA;
	Thu, 27 Oct 2022 15:22:45 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73045C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 15:22:44 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id 11so1835741iou.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HxpllMXSyRRubxLgoayjUesqyGC/uinE0txBvVN+Cnc=;
 b=FVaQQJ1qKo9y9KEoyRhSEF/Ibux2MrwOZWCh+KifQHnF68LiEIyBvvIQ8TVb6ovDE4
 XkJnmQnxmQ9IK4xZNLffhe6ZmU6bM4I6BoaC1+9d5eUPkMgeAAwbNGiREW/SX8mDqjc5
 0XrwB9K1MKjP2Xr9AFpF1a2O4DCY/iOadNI+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxpllMXSyRRubxLgoayjUesqyGC/uinE0txBvVN+Cnc=;
 b=Bsa0gU3lygb+MNZ6+H8kj84CWHalInV8jOL7NgAla9BYsOPZ7tH0jbIu5iQG9hHFDj
 LtCwXVl74jdVePtE60lm8+zUOsmVug80H1ZnmPq0zmBM++5USqiwosV/NhXp2i8/mQol
 R1UbZAfGphKaBzaQhmWjCw7bsUhLO6vUrwcSVE+dqB2JURBgCyDHYFxAojk7SJrmX/WW
 hMkE3Kvnf7rjtOU2W/ND+MR+cIuOyE/iTjyPiwlijvLMfWv/lxvxXxzgPaVcDjzEqOII
 Udh5w10ACK5eAQfXh2XAFSePjyxCzStM3eosbmVHeR/3BeomRBzUpCLmYcrvIjWD7iiY
 YCuw==
X-Gm-Message-State: ACrzQf3YD7JVsKqCZW+pXWxUaxhO+c0514VORe4vDeuRC1n9V5CGdMPG
 OgwJqqyX3JxiMSH2Y1DUFFugOKh8n3bcSNR4jxGHsQ==
X-Google-Smtp-Source: AMsMyM4cIYqgeVvSnez6Botw44EPni4GK8eSD71Kniq/06xl0u5MySvvWdl9uHVIkZ3LMAxRnMTn7EkvPDC7xGlVTlA=
X-Received: by 2002:a05:6602:2c04:b0:6ab:d29a:7000 with SMTP id
 w4-20020a0566022c0400b006abd29a7000mr28371958iov.204.1666884163064; Thu, 27
 Oct 2022 08:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
In-Reply-To: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Oct 2022 09:22:28 -0600
Message-ID: <CAPnjgZ1mJid6+9M0yumPdE79f7b2cAOKx1oZ7tnxkMM6y-aJkw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: pmic: ignore disabled node in
	pmic_bind_children
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

On Wed, 26 Oct 2022 at 07:05, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Ignore the disabled children node in pmic_bind_children() so the
> disabled regulators in device tree are not registered.
>
> This patch is based on the dm_scan_fdt_node() code - only the
> activated nodes are bound -  and it solves possible issue when a
> deactivated regulator is bound, error for duplicated regulator name
> for example.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> This patch solves the errors for duplicated regulator names on STM32MP15x
> boards since the alignment with Linux device tree with the commit
> 9157a4ce36b18 ("ARM: dts: stm32: update SCMI dedicated file").
>
> When SCMI is activated in "<board>-scmi.dts" device tree, the 3 regulators
> reg11, reg18, usb33 are duplicated (children of scmi_reguls and of
> pwr_regulators) even if the children of pwr_regulators are deactivated in
> the file arch/arm/dts/stm32mp15-scmi.dtsi.
>
>  drivers/power/pmic/pmic-uclass.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
