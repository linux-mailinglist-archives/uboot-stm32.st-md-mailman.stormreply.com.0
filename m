Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257F35028E
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Mar 2021 16:44:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06FE4C32EA6;
	Wed, 31 Mar 2021 14:44:01 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CAF3C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 14:43:59 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so19141613ota.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjs0IYIiS6QuzIjyHWXlqxE3HILbJT36/LgplOE/E+0=;
 b=RHdyMHLA7OD4qHvDYqg7NkDW80kirsyRV4/5szRHMOzO2yNzIbx7PlVp7IIgU+vOag
 YxSRCa3HfDdsiA+oBbeqK1iGydZ0ROgkLOI/5s9w0HmnWLdDQS5izn+ul+4wdy6mtaPa
 bvkJRT44LPCr47JUgn6a87ZD3bQhiXO7osZwfAHUPETZjExVjJ5ld2rm7XJZNqsMlvV8
 dLb1+g6dfTHjZ4wJDxT5paVqff7j2jFLj/3ui3lAPVc4cl8ISz7eMIrMM5rgwBBThV/2
 4sDzKgVp5dIKFZkvfAbZ1IjdZLi+1bHotInDxJ5PmPSnCkCxpb5nNn8fs3mMKoSyTtlN
 Ik9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjs0IYIiS6QuzIjyHWXlqxE3HILbJT36/LgplOE/E+0=;
 b=AjJ76sP5icZCG1jxxFtNLCnci8BiA1wGsrD1HHJhgF4kbnDwZKErjtMpqzeU2WZIsT
 3eUvnhJM2wQa9kkleGpD8ESHSaPcuRF5un8Q0AXgshWxARy3dwQnzrYjL6hdwPKvdq+q
 H+BaBE0pFErAmu4mDCgbZqH5xFdfRz8b/zpGoETzZFrvSDIhqLQjY12wwuRY3/LaS2BP
 kDycsT+3Zyc7xpR6nkCo9zabTPTY9jH4E3npDaTIpP5u2v/26pOn2FVpUa0Ci3joA4J6
 R3CrHDq6SPQtlrERBXLrovfEwHLW/z0qHUN61iIAJwMRRIoBhW12f8p7xC/Z5djjngBd
 1gpA==
X-Gm-Message-State: AOAM532fvAzt5MUezGNdtu3AzOjhSZI91QDQscgz/B8hmPzAQyI3EhnF
 sVeO5fH+oHdtIujF3J2uJEp/F3xl6xqlkJLT0Ss=
X-Google-Smtp-Source: ABdhPJx4qSU/x79nt7WNRJ7ZTLx2fzgxSDj1BLPtIrWG+tkObCDVhz5Kwfx1Tj6Xsfyh9w8dv315HHELJ2/8/n5B7Hk=
X-Received: by 2002:a9d:316:: with SMTP id 22mr2901397otv.210.1617201838000;
 Wed, 31 Mar 2021 07:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
 <5d06fe48-bf97-8d23-36e7-8a509f0127ed@denx.de>
In-Reply-To: <5d06fe48-bf97-8d23-36e7-8a509f0127ed@denx.de>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Wed, 31 Mar 2021 17:43:46 +0300
Message-ID: <CAGi-RU+jA-zSy9n7zMJ--AEVuV0gi=vr5Q=eMZhZ5c57AT2gPQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: cosmetic: remove unused
	define EQOS_DESCRIPTOR_ALIGN
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

On Tue, Mar 30, 2021 at 5:12 PM Marek Vasut <marex@denx.de> wrote:
>
> On 3/30/21 2:34 PM, Patrick Delaunay wrote:
> > Remove the define EQOS_DESCRIPTOR_ALIGN unused since the
> > commit 6f1e668d964e ("net: dwc_eth_qos: Pad descriptors to cacheline size")
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>
> Acked-by: Marek Vasut <marex@denx.de>
>
> Thanks
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
