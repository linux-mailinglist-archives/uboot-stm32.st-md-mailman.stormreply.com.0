Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B76437ED4
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 21:49:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68BA5C5E2A0;
	Fri, 22 Oct 2021 19:49:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DAE8C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 19:49:29 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y12so5074154eda.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cRPL0xIXUZHIgzbzPwgqZsjQgs4oRM+WXHh/8lGZuB8=;
 b=DI5oP/pRoOu1y6nzlCLQ5p+lWqP5IMb77q6zFr2ufqaXVLLiacPMf62peqv6PxVRrC
 /F/S/saofoy+a0y6uMQtY9aF2ls7NLsBaXjFGlkvY7Q+v8+x4Rz3hMLmqxqp3XVPI/v9
 gf/eg7V7XxAhl23PePJxEQE6R4RshPpf+51ELkq4P+whTO+rBD8PGWNcnplvwvREjqgI
 jwadevHAxldzYpzQAf8DQ1fE5olUWOLY9Mt4Wst/D8P970P8KyPH6YX+LKisRvPQyu94
 hjITC+aG94Tkmps6n25oA8r+X4/3fi0rxF+5it43hef5dOACJTF3H75ex1Ia/mHhO6AM
 p68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cRPL0xIXUZHIgzbzPwgqZsjQgs4oRM+WXHh/8lGZuB8=;
 b=d39BpXw69tiuHL3SuclTQpBTgOvQajIqgfQdzMoIU0s9uPbcxR0CK6vovCwFkP9SD/
 blRJhp2ms0ZGZ3v7n2/wxieXNCHU1ixjr7UDvVOWdgBzeBjAdQADkfpudHg1NJ2feHPF
 slbSSICEtBvNPZrnHpTKqc3JZ9g+WgsjxLZ3ukdLsSXE6pFxVSF3XR9peWfPohh9TKFG
 IkmEFTuVU5kmPrTR2XtM8ZEmAcO7k/2ffJhPaVfMazDDsrGU9QUYvNu3UdFqzW2bEeNt
 FIrBRR2U6wFJaGLxjU9r8N7WMSArB9jRKp2/gFDhY74lUlZr87NoZfBKWXKc2TXPSjrO
 +SKw==
X-Gm-Message-State: AOAM533bt+PLdyomX4ztgFpp6XurzYYQB/EfRGCMvaPmXHhy4euQExYO
 8nc9RrnEjIYhb3/OOarCCn9kDjhzcLMxI1/4XuA=
X-Google-Smtp-Source: ABdhPJzmh92q+5v44BFYSROQSBTL2YdCBub8Xg7XGKCr7Vbt/CqTCxUoUuCtPOuFjLUcdO7uL5IFoEBaR6Aaqz79Txc=
X-Received: by 2002:a17:906:48ce:: with SMTP id
 d14mr1977201ejt.336.1634932168461; 
 Fri, 22 Oct 2021 12:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
 <CAHCN7xJOtTDtF1BoNChO=_4OPmdPoJQ=zg3Of3y0RUJfrhabrQ@mail.gmail.com>
 <20211022212605.6ff8998a@thinkpad>
In-Reply-To: <20211022212605.6ff8998a@thinkpad>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 22 Oct 2021 14:49:17 -0500
Message-ID: <CAHCN7xKB_QZU8=sNV4n_kyAX=LSjtqFM=1J-96Yom2NJJco0zA@mail.gmail.com>
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] Question: LTO and failing objcopy in
	"u-boot-initial-env" target
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBPY3QgMjIsIDIwMjEgYXQgMjoyNiBQTSBNYXJlayBCZWjDum4gPG1hcmVrLmJlaHVu
QG5pYy5jej4gd3JvdGU6Cj4KPiBPbiBGcmksIDIyIE9jdCAyMDIxIDE0OjE5OjE2IC0wNTAwCj4g
QWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIGFtIG5vdCBzdXJl
IGl0J3MgdGhlIHJpZ2h0IHNvbHV0aW9uLCBidXQgaXQgYXBwZWFycyB0byB3b3JrIGZvciBtZQo+
ID4gb24gYSBib2FyZCB0aGF0IHVzZXMgTFRPLiAgSSBkaWRuJ3QgdHJ5IGl0IHdpdGggYSBib2Fy
ZCB0aGF0IGRvZXNuJ3QKPiA+IHVzZSBMVE8uCj4KPiBOZWVkIHRvIGJlIHRlc3RlZCB3aXRoIEdD
QyBhcyB3ZWxsIGFzIENsYW5nLgoKQWdyZWVkLgoKSSB0dXJuZWQgb2ZmIExUTywgYW5kIGdvdCBh
biBlcnJvciwgc28gSSB1cGRhdGVkIHRoZSBkaWZmIHRvOgoKCmRpZmYgLS1naXQgYS9NYWtlZmls
ZSBiL01ha2VmaWxlCmluZGV4IDUxOTRlNGRjNzguLjM4NjE4MGU5MzUgMTAwNjQ0Ci0tLSBhL01h
a2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0yMzAzLDcgKzIzMDMsNyBAQCBlbmRpZgogICAgICAg
ICQoUSkkKE1BS0UpIC1mICQoc3JjdHJlZSkvc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0CgogcXVp
ZXRfY21kX2dlbmVudiA9IEdFTkVOViAgJEAKLWNtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0tZHVt
cC1zZWN0aW9uIC5yb2RhdGEuZGVmYXVsdF9lbnZpcm9ubWVudD0kQAplbnYvY29tbW9uLm87IFwK
K2NtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0tZHVtcC1zZWN0aW9uIGAke09CSkRVTVB9IGVudi9j
b21tb24ubyAtdAp8Z3JlcCAtbTEgZGVmYXVsdF9lbnZpcm9ubWVudCB8YXdrICd7cHJpbnQgJCQ0
fSdgPSRAIGVudi9jb21tb24ubzsgXAogICAgICAgIHNlZCAtLWluLXBsYWNlIC1lICdzL1x4MDAv
XHgwQS9nJyAkQAoKIHUtYm9vdC1pbml0aWFsLWVudjogdS1ib290LmJpbgoKCkl0IG5vdyBhcHBl
YXJzIHRvIGJ1aWxkIHdpdGhvdXQgZXJyb3Igd2l0aCBMVE8gZW5hYmxlZCBhbmQgZGlzYWJsZWQu
Cgo+Cj4gTWFyZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
