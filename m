Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78312CB90
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50AD5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:22 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65753C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:21 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id z64so4379544oia.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIUwgRfJiadLEBrGrjOOvbWiBoO2bWrO3RYWcXS0Jds=;
 b=jS0dHQOu8s46CQrMQixfjAZEaDoLyaGLMni/YTmyBat3Lb5WYNxn9glTrU+6C54VCj
 Wu7iOUAN8pY3VsDHimHtmhlsuNEu4oar6s0k81LX6A2hqpr6UyOYF9CiAwhi063F483A
 QPKps/FB7Fz4uQmDvwMgxTv4jpLecRnqS1Qm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIUwgRfJiadLEBrGrjOOvbWiBoO2bWrO3RYWcXS0Jds=;
 b=dZdN6BsEN3CzFiw1o+4auSl4zHC+uel6wPSgGdpgkcCEJ7bMVBPs6KAlNyHC/y2mKT
 h4W028ds9zP0PGX4ZsCcFrvPpBKEjkE3b1B8XQ+qJmSW0PtqTvd4SiZxtrLkRJO9J58o
 QVUlREgy8k+SN79mNq3bgscQAAb1zue7GB9eKCnCZL4HhXmfviUOxjqTISqVZvJ7jQ/I
 MzJmYCiQOhRH9ImGIQt+nTRRHY9wmJGJY/IzBZERF2ijP8Z6IhFc6TG64xxGN6z7OneR
 EKl2KAS+g7F1YbzYn4ygHn9HbdRaS1gJ5ZvwbtuUZ/OMFYTRvTNyY0sGW2Poq0I4aU57
 lC4Q==
X-Gm-Message-State: APjAAAVztTZTh/WHcd2C0AY+optaO9GikfB9g4cpn4u0m0V7mlDXPjMi
 0xKLXEexEpm7UtUSjpDzARP7VgIhAkeboih+Oww9Rw==
X-Google-Smtp-Source: APXvYqz3edFvL7nVCqZE+4PRmM/V2spVGq+qSdjxTCtGjnTzP0aEm5mBsPdRYLTkz7ChTr4xzKkd1Vk+vQi4yml8cZE=
X-Received: by 2002:a05:6808:150:: with SMTP id
 h16mr4761912oie.130.1577668879845; 
 Sun, 29 Dec 2019 17:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-3-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:07 -0700
Message-ID: <CAPnjgZ1YrAf5VQTTsXge6SLhU=hNV9SwZoa=nyeVozQ8PHzW-A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 02/14] dm: core: add ofnode and dev
 function to iterate on node property
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add functions to iterate on all property with livetree
> - dev_read_first_prop
> - dev_read_next_prop
> - dev_read_prop_by_prop
> and
> - ofnode_get_first_property
> - ofnode_get_next_property
> - ofnode_get_property_by_prop
>
> For example:
> struct ofprop property;
>
> dev_for_each_property(property, config) {
>         value = dev_read_prop_by_prop(&property, &propname, &len);
>
> or:
> for (prop = ofnode_get_first_property(dev_ofnode(dev));
>      prop;
>      prop = ofnode_get_next_property(dev_ofnode(dev),prop))
> {
>      value = ofnode_get_property_by_prop(dev_ofnode(dev), prop,
>                                          &propname, &len);
> ....
> }
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Identify property with a new struct ofprop as proposed
>   by Simon Glass
> - Add dev_ iterate functions
>
>  drivers/core/of_access.c | 32 +++++++++++++++++++
>  drivers/core/ofnode.c    | 48 ++++++++++++++++++++++++++++
>  drivers/core/read.c      | 16 ++++++++++
>  include/dm/of_access.h   | 40 ++++++++++++++++++++++++
>  include/dm/ofnode.h      | 63 ++++++++++++++++++++++++++++++++++++-
>  include/dm/read.h        | 67 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 265 insertions(+), 1 deletion(-)

These look good, but please add a few simple tests like in your commit message.

See test/dm/ofnode.c, or you could add test/dm/read.c and just use the
read interface which would be good enough It think, since tests run
with and without livetree.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
