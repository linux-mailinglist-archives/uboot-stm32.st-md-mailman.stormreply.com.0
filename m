Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AD2C8EC5
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:13:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F47C3089F;
	Mon, 30 Nov 2020 20:13:13 +0000 (UTC)
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07940C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:13:12 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id p15so1323959oop.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5jAnIU2TpM86BDzTvky3JGU365/8fuoZAv2RHjd4aI=;
 b=bYMWOz/XgQwIQfwnOl//EMrVSMg0HAVw+RrUVusuPXcgUaoywcwmeGHpxtxmGyyIu6
 fZxxWdhu4+t+qveCngn5tR9a9kbXN8sUXk/Fo8HfjNZ6RZr8GrNYUsdgimbN1Ts/G+hj
 SuDVvuKh/Da9/+aLsYqwNIHa5knC4doCTQGRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5jAnIU2TpM86BDzTvky3JGU365/8fuoZAv2RHjd4aI=;
 b=amhuoouNXrEkwcbA9YinLzE+rLS8I+RePYRZJ4q6j9ku8h+nWd9zQGd0G5QKJhTWWB
 /zYf8CroAY5iLK2hdfhf9nHry6mK7UFk81LNEgQsQFFkjosKj5gEZS0FUWFFsqrIOtAl
 oC2UB6/GB/5dJFB7a9BrKSwJvIihTIi9iBD+Wy+g55B+/NlzkDwR6bjLHSQQPdWIux8+
 mA1DK1Lg58yPLtf8N338Y9eBXOZ0fL9sCCQhyF0BKHC4w7XOEYpa0qzB7w14bSkpCKEz
 WAau2XvKww+5bCZ3wZjHw7mbepCcbaGy6abMgTdHGy5J8h7tUbFhjK7NNtgl7lhJ6CF/
 ImSw==
X-Gm-Message-State: AOAM5305VZqmPX00SosNBRF/EEgr611SOAWqGZASYN8fye4hJkP9v6IK
 9EM9mMGc9Lb4CbJ64Yobcy2n0LBVHXFNSsgqz9zY3A==
X-Google-Smtp-Source: ABdhPJxVE4oGKGXU5Iz61DcKfnJ3SQT1ytW0kMyFpxpZB+JYDfk9AqaTzkXSVJIzA2vljTecMTGi2+kMJk49OB7P0wg=
X-Received: by 2002:a4a:9711:: with SMTP id u17mr16810262ooi.57.1606767190589; 
 Mon, 30 Nov 2020 12:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-7-patrick.delaunay@st.com>
In-Reply-To: <20201127102100.11721-7-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:16 -0700
Message-ID: <CAPnjgZ1ez6PZFjqDvYfvhztmBtBUjAAn+W=UeUP3w-34j1Te1w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 8/9] test: log: add test for console
	output of dropped messages
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

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a new test to check the content of the dropped messages
> sent to console puts function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - added test for content of dropped messages (NEW)
>
>  test/log/log_test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
