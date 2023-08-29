Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C31778C9A7
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Aug 2023 18:29:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F6EC65E56;
	Tue, 29 Aug 2023 16:29:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A436EC65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 16:29:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TC1pbn002739; Tue, 29 Aug 2023 18:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=VVzjf21Dso9Z3rBfL/k6z0SPmOknPqiL6aHhwu0orSQ=; b=dl
 +aa2CCKNspb08zywDM8wowkLo0ZU9m4gC7hJpK875vJ2nh+qS+fwKIp1dgBvcdjX
 CvMTsHw8Fhng6tPqb+X7Q2njkH0hov6pZ7pnFJ/q1l49EajScgyTVbmXqPIc0eqj
 0IGDXKri+zLEQ+8hE3wwOvcaR7wry4vIhq44LGgcvWN61Vq2psxDvUqi1XH+delc
 4negsJJgvkNo2sSRRy2Z1+e/P3MiEaLZ5GEvE1+/O9jZLSLvEbiOUUk/ADKqABpj
 ovwWihquWdi9Jtxu1DyXWPxDmBRIxcDG6HFDgzAyqVHp6NQXHvGhrJd1iklPcXGt
 vIUehl5CeXQvH0VDtTiw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq89bw3pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 18:28:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A679A100057;
 Tue, 29 Aug 2023 18:28:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E8D820F578;
 Tue, 29 Aug 2023 18:28:52 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 29 Aug
 2023 18:28:51 +0200
Message-ID: <8091c4f9-a0ce-aa69-098f-2effdb68ffdb@foss.st.com>
Date: Tue, 29 Aug 2023 18:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>, Simon Glass
 <sjg@chromium.org>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
 <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
 <20230824142505.GM3953269@bill-the-cat>
 <4cbffed6-6a07-1a56-bf10-7303e2aff78b@denx.de>
 <20230824151419.GU3953269@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230824151419.GU3953269@bill-the-cat>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_13,2023-08-29_01,2023-05-22_02
Cc: u-boot@dh-electronics.com, U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] stm32mp15: Use u-boot-spl-stm32.bin
 instead of u-boot-spl.stm32
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgU2ltb24sCgpPbiA4LzI0LzIzIDE3OjE0LCBUb20gUmluaSB3cm90ZToKPiBPbiBUaHUsIEF1
ZyAyNCwgMjAyMyBhdCAwNTowOTowN1BNICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24g
OC8yNC8yMyAxNjoyNSwgVG9tIFJpbmkgd3JvdGU6Cj4+PiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBh
dCAwNToxMjo0NUFNICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+PiBPbiA4LzI0LzIzIDA1
OjAyLCBTaW1vbiBHbGFzcyB3cm90ZToKPj4+Pj4gQSAnLnN0bTMyJyBleHRlbnNpb24gaXMgbm90
IGFsbG93ZWQgYW55bW9yZSwgc28gY2hhbmdlIGl0Lgo+Pj4+IFdoeT8KPj4+Pgo+Pj4+IFRoaXMg
d2lsbCBsaWtlbHkgYnJlYWsgYSBodWdlIGFtb3VudCBvZiBzY3JpcHRzLCBJJ20gdGVtcHRlZCB0
byBOQUsgaXQKPj4+PiB1bmxlc3MgdGhlcmUgaXMgYSB2ZXJ5IGdvb2QgcmVhc29uLgo+Pj4gVGhp
cyBpcyBpbiB0aGUgY292ZXIgbGV0dGVyLiAgVG9kYXksIGJ1aWxkbWFuIC0ta2VlcC1vdXRwdXRz
IGRvZXNuJ3QKPj4+IGFjdHVhbGx5IGtlZXAgdGhlIG5lZWRlZCBmb3IgYm9vdGluZyBvdXRwdXRz
IGZyb20gYSBidWlsZCBmb3IgYSBudW1iZXIKPj4+IG9mIHBsYXRmb3Jtcy4gIFNpbW9uJ3MgcmVz
cG9uc2UgaXMgdG8gc3RvcCBoYXZpbmcgYSBmcmVlLWZvcm0gbGlzdCBvZgo+Pj4gb3V0cHV0cy4g
V2l0aCBJIGd1ZXNzIHRoZSBjYXZlYXQgYmVpbmcgUk9NLWRlZmluZWQgbmFtZXMgKGZvciBleGFt
cGxlLAo+Pj4gd2Ugc3RpbGwga2VlcCAiTUxPIiBiZWNhdXNlIHRoYXQgaXMgdGhlIGxpdGVyYWwg
ZmlsZW5hbWUgVEkgUk9NIGxvb2tzCj4+PiBmb3Igb24gRkFUIHBhcnRpdGlvbnMsIG9uIG1vcyBv
ZiB0aGVpciAzMmJpdCBwbGF0Zm9ybXMpLgo+PiBXaHkgbm90IGp1c3QgcGxhY2UgdGhlIGZyZWUt
Zm9ybSBmaWxlcyBpbnRvIHNvbWUgb3V0cHV0LyBkaXJlY3RvcnkgYW5kIGJlCj4+IGRvbmUgd2l0
aCBpdCA/IFRoZW4gdGhleSBjYW4gaGF2ZSB3aGF0ZXZlciBleHRlbnNpb24gdGhleSB3YW50LCBh
cyBsb25nIGFzCj4+IHRoZSBvdXRwdXQvIGRpcmVjdG9yeSBuYW1lIGlzIHN0YWJsZS4KPiBZZXMs
IGFuIGFsdGVybmF0aXZlIGhlcmUgaXMgdG8ganVzdCBleHRlbmQgdGhlIGxpc3QgdGhhdCdzIHJl
bW92ZWQgaW4KPiBwYXRjaCAyLzYuCj4KClRoZSAiLnN0bTMyIiB3YXMgY2hvb3NlbiBvbiBvdXRw
dXQgb24gbWtpbWFnZSB0byBiZSBhbGlnbmVkIHdpdGg6CgotIGFsbCBTVE1pY3JvZWxlY3Rvbmlj
cyBkb2N1bWVudGF0aW9uwqAgKGZvciBleGFtcGxlIApodHRwczovL3dpa2kuc3QuY29tL3N0bTMy
bXB1L3dpa2kvU1RNMzJfaGVhZGVyX2Zvcl9iaW5hcnlfZmlsZXMpCgotIHRoZSBwcm9wb3NlZCBz
Y3JpcHRzIG9yIGZpbGVzLCBpbiBwYXJ0aWN1bGFyIGluIHRoZSBZT0NUTyBnZW5lcmF0ZWQgCmZs
YXNobGF5b3V0IGZpbGVzLgoKLSB0aGlzIGV4dGVuc2lvbiBsaXN0IGV4cGVjdGVkIGJ5IG91ciB0
b29sczogU1RNIEN1YmVQcm9ncmFtbWVyIAooaHR0cHM6Ly93aWtpLnN0LmNvbS9zdG0zMm1wdS93
aWtpL1NUTTMyQ3ViZVByb2dyYW1tZXIpCgphbmQgU2lnbmluZyB0b29scyAoaHR0cHM6Ly93aWtp
LnN0LmNvbS9zdG0zMm1wdS93aWtpL1NpZ25pbmdfdG9vbCkKCgpTbyBJIHByZWZlciB0byBrZXB0
IHRoZSAiLnN0bTMyIiBleHRlbnNpb24gaGVyZToKCglmaWxlbmFtZSA9ICJ1LWJvb3Qtc3BsLnN0
bTMyIgoKCk5COiB0aGUganVzdGlmaWNhdGlvbiBmb3IgYnVpbGRtYW4gJy1rJyBvcHRpb24gc2Vl
bnMgbm90IGZ1bGx5IHJlbGV2YW50IGhlcmUKCiDCoMKgwqDCoMKgwqAgYmVjYXVzZSBpbiBwYXRj
aCAyLzYgeW91IGtlcHQgbm90IG9ubHkgdGhlIEFMTE9XRUQgZXh0ZW5zaW9uIGJ1dCAKYWxzbyBz
b21lIHBhcnRpY3VsYXIgZmlsZXMKCisgICAgICAgICAgICAgICAgdG9fY29weSA9IFsndS1ib290
KicsICcqLm1hcCcsICdNTE8nLCAnU1BMJywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICdp
bmNsdWRlL2F1dG9jb25mLm1rJywgJ3NwbC91LWJvb3Qtc3BsKiddCisgICAgICAgICAgICAgICAg
dG9fY29weSArPSBbZicqe2V4dH0nIGZvciBleHQgaW4gQUxMT1dFRF9FWFRTXQoKCnNvIGFsbCB0
aGUgZmlsZXMgInUtYm9vdCoiIGFyZSBrZXB0IHdpdGggYnVpbGRtYW4gLWsgZXZlbiBpZiBpdCBp
cyBub3QgYSAKYWxsb3dlZCBleHRlbnNpb24uCgoKSSBwcm9wb3NlIHRvIGNoYW5nZSB0aGUgcGF0
Y2ggMS82IGlmIHlvdSBhcmUgYWdyZWUKCmFuZCBhbGxvdyBiaW5tYW4gdG8gZ2VuZXJhdGUgdGhl
IGZpbGUgd2l0aCBzYW1lIHJ1bGVzIHRoYW4gYnVpbGRtYW4gLWsgCm9wdGlvbiBpbiBwYXRjaCAy
LzYKCgpUaGUgZmlsZW5hbWUgaXMgdmFsaWQgaWYKCi0gdGhlIGZpbGUgaXMgbmFtZWQgd2l0aCB0
aGUgYWxsb3dlZCBwcmVmaXggJ3UtYm9vdCcgPT4gJ3UtYm9vdConIHNvIAoidS1ib290LXNwbC5z
dG0zMiIgaXMgYWxsb3dlZAoKLSB0aGUgZmlsZSBpcyB3aXRoIGFsbG93ZWQgZXh0ZW5zaW9uID0+
LmJpbiwgLnJvbSwgLml0YiwgLmltZwoKClJlZ2FyZHMKCgpQYXRyaWNrCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
