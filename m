Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F6E94D0
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD8DDC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:25 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F1AEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:23 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y194so624284oie.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4X9J2nv3vk7zGu7TSba/cZdvLqgtQXMopuBZgDa2POg=;
 b=eGMnLHnqKsseuc6f0/iDtc9qaeslGS397UnAFogVPJM1u3TjJEkdPtMohkCTZ3OPwH
 XM97IfsmPDODj9MK0IVNAH49k/w8482N5oo5K+Uk6Ie6Fo6ADGElQ0vxfTqvf8wgw3Mk
 0vNZxNFQGZLec8PwsiT3kv5Hu9HkyqCnpyfEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4X9J2nv3vk7zGu7TSba/cZdvLqgtQXMopuBZgDa2POg=;
 b=kpKLh/0FZqnSGeAYZ52osIa1QUotzVXSLvg2nUZZIapJ9OilOwuWXFzx/jMgOAPX5F
 z/n7ehtqKZiAzfNfqPDiXR05KV8HsJ4zxO2ilKnvAYfex1zZ+K+cXC+FD0mSwncgrym1
 cmbfrcqNHAPEzbcq32JGYMaXnmylxAwmwFBzWJb55NrfrGbNT+9Xg5So98agqh2HVC6Q
 Ftyr47JMrgzocMLJHRywOHz0hJ5psQrCqkR5Vy3q7k6dECZ4IGsvTOQRsAPNQmpLirNw
 S4eXimjwCKw8M/63RKrQXekjNbgHgAJmxj3JJClb0b4CNaoYcIfaWssv2aynQDm1XQKi
 T7jQ==
X-Gm-Message-State: APjAAAV4pNo0KEljHHVbn+G5ap8hFfs6p6SdVCDh5D4hgdSZ3e+Tvak+
 Z7SrZtFvAf/J4oGsT9L03b1MEYtx4Qwe8FhhfZFf2A==
X-Google-Smtp-Source: APXvYqzc5Dwh/sQeyTAgHAA9N1bHpSICAO/h2rS0nWjmSZHvVozO79nIHGmGpedfHJKxx20CRsrZuk+6hJwXe6S/2Jo=
X-Received: by 2002:aca:451:: with SMTP id 78mr6837952oie.170.1572400101573;
 Tue, 29 Oct 2019 18:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-5-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-5-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:09 -0600
Message-ID: <CAPnjgZ07D0E6WQJ9B2zfr7vHcP3tMw7twbdHZkTtcfGnHUDb9Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 04/13] dm: pinctrl: migrate
	pinctrl-generic to livetree
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

Hi Patrick,

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Migrate pinctrl-generic to livetree:
> - ofnode_get_first_property
> - ofnode_get_next_property
> - ofnode_get_property_by_prop
> - ofnode_read_string_count
> - ofnode_read_string_index
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>
> This solve parsing issue during test in sandbox for pin
> configuration (OF_LIVE is activated in sandbox_defconfig
> and sub node are not correctly parsed in
> pinctrl_generic_set_state_subnode with fdt lib API).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-generic.c | 36 +++++++++++++++----------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>

It looks like this should use dev_read_...() too.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
