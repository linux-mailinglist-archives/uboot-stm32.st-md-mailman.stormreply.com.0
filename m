Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A626814D525
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F299C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:22 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D565C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:20 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y19so1147071lfl.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJ36PKQJlaAjMbXIcqP+bYCmm3b0oL8Noct40c37yLE=;
 b=ejqL/sZyRVyl0affw9EG1ChsZ/Bg9GXTM0cwDonXqBhM/wOpzxVJ5ClpD6MiNE/pIL
 x/Ge6P2kPx/IJEnCl/ksOvG8QkcW/Akpg9jvKjJXwiev8JB3Jl8IoVTgjmFYYeSCtt2j
 JViqjUAXVkbNHXra6utUvWlpGsKO9ktSa1m+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJ36PKQJlaAjMbXIcqP+bYCmm3b0oL8Noct40c37yLE=;
 b=Br0/lyUV+9tPOFdnvWFTXHo2Yg80BJy/RMmQGw0wfVghj0J5IqHDo7U/r0clghKTW/
 pff4lOJgAm24aQHeiihBMTfkag/DnWdD2kxyontCZz4rcX4oVDM80RnCg5hB4MgDeZ4o
 K0pS6uUnOlQ87M4hEPIZ300j/ER9BRPhU8bdbcikXEFkDmjGM00iGEsX/olmGethJ9qP
 //HJsPPRITjpPAGwLVIcOSMPnpjPLUOHGc89PEQDZ310MVARBKerifUi6TuAxie/H5Ib
 XcNf3+5xsn1HLBpZkg6qcuWH5OOFnjrl7An/iY199vn1KrRFVzU1pPwyYbEBLY71/vz4
 myAA==
X-Gm-Message-State: APjAAAV8ud+Kd8n6NSL1xk0GhFTZE8A4IYabbtmbip3OEwDDs2KDipqa
 Xg9mhHUSHPpm3p3fBnPXRsBjRFtSvpRboJ9E3S/wrw==
X-Google-Smtp-Source: APXvYqwsHroV92qc6l0H1uegWGRVSP79evWa17RxXlWDnzm5tz4xw7gnFH6bUW8V/aK2NsNCVwTaUO9L0cw6E6bARK4=
X-Received: by 2002:ac2:5e9b:: with SMTP id b27mr1290345lfq.184.1580350699632; 
 Wed, 29 Jan 2020 18:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-3-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:58 -0700
Message-ID: <CAPnjgZ3yqo=kh5_8FBdPaMuG7KexDAhuFgB1AE9W+t5uHoN6xA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 02/21] dm: core: add ofnode and dev
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

On Mon, 13 Jan 2020 at 03:35, Patrick Delaunay <patrick.delaunay@st.com> wrote:
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
> And helper: dev_for_each_property
>
> For example:
> struct ofprop property;
>
> dev_for_each_property(property, config) {
>         value = dev_read_prop_by_prop(&property, &propname, &len);
>
> or:
>
> for (res = ofnode_get_first_property(node, &property);
>      !res;
>      res = ofnode_get_next_property(&property))
> {
>      value = ofnode_get_property_by_prop(&property, &propname, &len);
> ....
> }
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - add test dm_test_ofnode_get_property_by_prop
> - udpate ofnode example in commit message
> - solve comment for ofnode_get_property_by_prop (and not by of_ofprop)
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
>  test/dm/Makefile         |  1 +
>  test/dm/ofread.c         | 50 ++++++++++++++++++++++++++++++
>  8 files changed, 316 insertions(+), 1 deletion(-)
>  create mode 100644 test/dm/ofread.c
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
