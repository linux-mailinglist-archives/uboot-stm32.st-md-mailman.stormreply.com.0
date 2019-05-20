Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E780523CE8
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 18:09:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AB85C5EC5E
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 16:09:34 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A62FCC5EC5C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 16:09:31 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id z65so10383266oia.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNsdyABAEHcMpcYTtuoY5nwiPvN6JbiI9UM4ZCi4gds=;
 b=ULlQvtLP7rBPNNNpOoXMimSQUU74RbDXm1TRel6BoWRxNbGJyLYq9E67tJzEHEQNbz
 3nZaP9g/TACguRAX+7ZxSwoRG7llS8CEZgg1gEc1SCEc+3J+mW8Q5LUAVZQHp9O5ERA1
 KiW+EE8fVmt67PrLqUNfpmVEHd9JZESS3g0Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNsdyABAEHcMpcYTtuoY5nwiPvN6JbiI9UM4ZCi4gds=;
 b=MzOCH7LwO8unlh2w4/6a+WncUQORguPuYD72C3mGD9lBezjV5BQVsJ5iaVYKgrSj8M
 skTONRlQdlWo9DsKqWP9wWrZXxfzOufbijn0aE5mAHRbxFngBvs6lvHOKOA21a1lPm3L
 tQMGcvBOajqvJfoBuTjflCwJtMGF0wdzVHCZSyu2DjbQOpT971iLZQ9OIzgaiGq6RGSm
 C5jGweI6NPSgyDkesy0SHttBnxm9mehqA8duz9iwFhrtJCMANAuIer7xX+EACsit/I5/
 m+i4BHv5SLi9Nw380lJpHcKP0ga/SIT8Nso62h8rJg7dvL8K1EcGe1DS4VjARpDM9/Wu
 ywCg==
X-Gm-Message-State: APjAAAWaO84lIZnwJqxJx17WhTucvlWjRfBpv2NXvk+PQnvIM/gUg8LI
 Kqp6JCV81DABC4AZ9FK0oUtFZSZCDHgLrOuxrvQfqQ==
X-Google-Smtp-Source: APXvYqy3jRhivNNtUT87uzviaHp/YyZz25aR4B94OFZVsJaYlQfIarsoo7/Yjmde7/dBgcBn+yvsMFSRRUT57Yo82MY=
X-Received: by 2002:aca:df07:: with SMTP id w7mr5729312oig.130.1558368570151; 
 Mon, 20 May 2019 09:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-9-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-9-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 10:09:18 -0600
Message-ID: <CAPnjgZ0Yh1WeZA3hpJNeWQDvW7PbMeFfNs=7AOfs4A3M1frAMA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tien Fong Chee <tien.fong.chee@intel.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 8/8] dm: doc: add documentation for
 pre-reloc properties in SPL and TPL
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

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add documentation for the pre-reloc property in SPL and TPL device-tree:
> - u-boot,dm-pre-proper
> - u-boot,dm-pre-reloc
> - u-boot,dm-spl
> - u-boot,dm-tpl
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v2:
> - rebase on master
>
>  doc/README.SPL              | 16 ++++++++++++++++
>  doc/README.TPL              |  4 ++++
>  doc/driver-model/README.txt |  4 ++++
>  include/dm/ofnode.h         |  6 ++++--
>  include/dm/util.h           |  6 ++++--
>  5 files changed, 32 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
