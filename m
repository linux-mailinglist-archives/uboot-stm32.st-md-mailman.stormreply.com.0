Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5254F3C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:00:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D57C5F1F2;
	Fri, 17 Jun 2022 09:00:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3445FC5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:00:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H4o1jU008203;
 Fri, 17 Jun 2022 11:00:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LbjTQGB1L2gG2gSO0WpuoiKsnsDXmAz3qPH4gW+E7ak=;
 b=LWMta8hTEBP2GXZuJwDNv7llQSxa/N7qZFUuT2xCqOqP3VlJIw8US+LfdMRydHhNYTFR
 GmbCOSKWwTg7ScXUWWl2WdswmxFXCwCBd33YyyGT0N5LHIvge6p0WbTz286Qdcz8c9VJ
 HGtenWVrpwn84DatbbMxFMlLC0Io0xne1Cyq0mL0xZR1R4eTy5iND+bIF4aourlxp2HW
 7tVu9DbGFNXrcpGPrDojq8R1k6HZ9CIblJVrumU3D/e3MWC2E4wIdbRs8ZKItzo8opgl
 X+ezT5FanGu486pfJnjaGdCYnMk9Amn5PaIyQmt7VnlQLGh5WBmRLXLPaaawjqx4Ykix 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqeb14sg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:00:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02DAE100034;
 Fri, 17 Jun 2022 11:00:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE8DF21A20E;
 Fri, 17 Jun 2022 11:00:38 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:00:37 +0200
Message-ID: <c8922f35-9feb-5b14-4ca8-c010e04ade7f@foss.st.com>
Date: Fri, 17 Jun 2022 11:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220506160540.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 11/16] board: stm32pm1: add stm32mp13
	board support
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

SGksCgpBY2NlcHRlZCB3aXRoIG1pbm9yIG1vZGlmaWNhdGlvbi4KCgpPbiA1LzYvMjIgMTY6MDYs
IFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4gQWRkIHN0bTMybXAxNXggcHJlZml4IHRvIGFsbCBT
VE0zMk1QMTV4IGJvYXJkIHNwZWNpZmljIGZ1bmN0aW9uLAo+IHRoaXMgcGF0Y2ggaXMgYSBwcmVs
aW1pbmFyeSBzdGVwIGZvciBTVE0zMk1QMTN4IHN1cHBvcnQuCj4KPiBUaGlzIHBhdGNoIGFsc28g
YWRkIHRoZSBSQ0MgcHJvYmUgdG8gYXZvaWQgY2lyY3VsYXIgYWNjZXNzIHdpdGgKPiB1c2JwaHlj
IHByb2JlIGFzIGNsayBwcm92aWRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgIGJvYXJkL3N0L3N0
bTMybXAxL3N0bTMybXAxLmMgfCAyNyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgYi9ib2FyZC9zdC9zdG0zMm1wMS9z
dG0zMm1wMS5jCj4gaW5kZXggZmZmMTg4MGU1Yi4uNGJhNzIwMWZmYiAxMDA2NDQKPiAtLS0gYS9i
b2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5jCj4gKysrIGIvYm9hcmQvc3Qvc3RtMzJtcDEvc3Rt
MzJtcDEuYwo+IEBAIC01NDcsOCArNTQ3LDcgQEAgc3RhdGljIHZvaWQgc3lzY29uZl9pbml0KHZv
aWQpCj4gICAJY2xyYml0c19sZTMyKHN5c2NmZyArIFNZU0NGR19DTVBDUiwgU1lTQ0ZHX0NNUENS
X1NXX0NUUkwpOwo+ICAgfQo+ICAgCj4gLS8qIEZpeCB0byBtYWtlIEkyQzEgdXNhYmxlIG9uIERL
MiBmb3IgdG91Y2hzY3JlZW4gdXNhZ2UgaW4ga2VybmVsICovCj4gLXN0YXRpYyBpbnQgZGsyX2ky
YzFfZml4KHZvaWQpCj4gK3N0YXRpYyBpbnQgYm9hcmRfc3RtMzJtcDE1eF9kazJfaW5pdCh2b2lk
KQo+ICAgewo+ICAgCW9mbm9kZSBub2RlOwo+ICAgCXN0cnVjdCBncGlvX2Rlc2MgaGRtaSwgYXVk
aW87Cj4gQEAgLTU1Nyw2ICs1NTYsNyBAQCBzdGF0aWMgaW50IGRrMl9pMmMxX2ZpeCh2b2lkKQo+
ICAgCWlmICghSVNfRU5BQkxFRChDT05GSUdfRE1fUkVHVUxBVE9SKSkKPiAgIAkJcmV0dXJuIC1F
Tk9ERVY7Cj4gICAKPiArCS8qIEZpeCB0byBtYWtlIEkyQzEgdXNhYmxlIG9uIERLMiBmb3IgdG91
Y2hzY3JlZW4gdXNhZ2UgaW4ga2VybmVsICovCj4gICAJbm9kZSA9IG9mbm9kZV9wYXRoKCIvc29j
L2kyY0A0MDAxMjAwMC9oZG1pLXRyYW5zbWl0dGVyQDM5Iik7Cj4gICAJaWYgKCFvZm5vZGVfdmFs
aWQobm9kZSkpIHsKPiAgIAkJbG9nX2RlYnVnKCJubyBoZG1pLXRyYW5zbWl0dGVyQDM5ID9cbiIp
Owo+IEBAIC02MDQsNyArNjA0LDcgQEAgZXJyb3I6Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAg
IAo+IC1zdGF0aWMgYm9vbCBib2FyZF9pc19kazIodm9pZCkKPiArc3RhdGljIGJvb2wgYm9hcmRf
aXNfc3RtMzJtcDE1eF9kazIodm9pZCkKPiAgIHsKPiAgIAlpZiAoQ09ORklHX0lTX0VOQUJMRUQo
VEFSR0VUX1NUX1NUTTMyTVAxNXgpICYmCj4gICAJICAgIG9mX21hY2hpbmVfaXNfY29tcGF0aWJs
ZSgic3Qsc3RtMzJtcDE1N2MtZGsyIikpCj4gQEAgLTYxMyw3ICs2MTMsNyBAQCBzdGF0aWMgYm9v
bCBib2FyZF9pc19kazIodm9pZCkKPiAgIAlyZXR1cm4gZmFsc2U7Cj4gICB9Cj4gICAKPiAtc3Rh
dGljIGJvb2wgYm9hcmRfaXNfZXYxKHZvaWQpCj4gK3N0YXRpYyBib29sIGJvYXJkX2lzX3N0bTMy
bXAxNXhfZXYxKHZvaWQpCj4gICB7Cj4gICAJaWYgKENPTkZJR19JU19FTkFCTEVEKFRBUkdFVF9T
VF9TVE0zMk1QMTV4KSAmJgo+ICAgCSAgICAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJzdCxz
dG0zMm1wMTU3YS1ldjEiKSB8fAo+IEBAIC02MzcsNyArNjM3LDcgQEAgVV9CT09UX0RSSVZFUihn
b29kaXgpID0gewo+ICAgCS5vZl9tYXRjaAk9IGdvb2RpeF9pZHMsCj4gICB9Owo+ICAgCj4gLXN0
YXRpYyB2b2lkIGJvYXJkX2V2MV9pbml0KHZvaWQpCj4gK3N0YXRpYyB2b2lkIGJvYXJkX3N0bTMy
bXAxNXhfZXYxX2luaXQodm9pZCkKPiAgIHsKPiAgIAlzdHJ1Y3QgdWRldmljZSAqZGV2Owo+ICAg
Cj4gQEAgLTY0OCwxMyArNjQ4LDIyIEBAIHN0YXRpYyB2b2lkIGJvYXJkX2V2MV9pbml0KHZvaWQp
Cj4gICAvKiBib2FyZCBkZXBlbmRlbnQgc2V0dXAgYWZ0ZXIgcmVhbGxvYyAqLwo+ICAgaW50IGJv
YXJkX2luaXQodm9pZCkKPiAgIHsKPiArCXN0cnVjdCB1ZGV2aWNlICpkZXY7Cj4gKwlpbnQgcmV0
Owo+ICsKPiArCS8qIHByb2JlIFJDQyB0byBhdm9pZCBjaXJjdWxhciBhY2Nlc3Mgd2l0aCB1c2Jw
aHljIHByb2JlIGFzIGNsayBwcm92aWRlciAqLwo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX0NM
S19TVE0zMk1QMTMpKSB7Cj4gKwkJcmV0ID0gdWNsYXNzX2dldF9kZXZpY2VfYnlfZHJpdmVyKFVD
TEFTU19DTEssIERNX0RSSVZFUl9HRVQoc3RtMzJtcDFfY2xvY2spLCAmZGV2KTsKPiArCQlsb2df
ZGVidWcoIkNsb2NrIGluaXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiArCX0KPiArCgo9PiB0aGlz
IGZvcmNlIFJDQyBwcm9iZWQgcmVtb3ZlZCB0byBhdm9pZCBpc3N1ZSB3aGVuIFJDQyBub2RlIGlz
IG5vdCAKcHJlc2VudCBpbgoKIMKgwqDCoMKgwqAgZGV2aWNlIHRyZWUKCiDCoMKgwqDCoMKgIGNh
biBiZSByZXBsYWNlZCBieSBETV9GTEFHX1BST0JFX0FGVEVSX0JJTkQgbWFuYWdlZCBpbiBSQ0Mg
ZHJpdmVyLgoKCj4gICAJYm9hcmRfa2V5X2NoZWNrKCk7Cj4gICAKPiAtCWlmIChib2FyZF9pc19l
djEoKSkKPiAtCQlib2FyZF9ldjFfaW5pdCgpOwo+ICsJaWYgKGJvYXJkX2lzX3N0bTMybXAxNXhf
ZXYxKCkpCj4gKwkJYm9hcmRfc3RtMzJtcDE1eF9ldjFfaW5pdCgpOwo+ICAgCj4gLQlpZiAoYm9h
cmRfaXNfZGsyKCkpCj4gLQkJZGsyX2kyYzFfZml4KCk7Cj4gKwlpZiAoYm9hcmRfaXNfc3RtMzJt
cDE1eF9kazIoKSkKPiArCQlib2FyZF9zdG0zMm1wMTV4X2RrMl9pbml0KCk7Cj4gICAKPiAgIAlp
ZiAoSVNfRU5BQkxFRChDT05GSUdfRE1fUkVHVUxBVE9SKSkKPiAgIAkJcmVndWxhdG9yc19lbmFi
bGVfYm9vdF9vbihfREVCVUcpOwoKCkFwcGxpZWQgdG8gdS1ib290LXN0bS9uZXh0LCB0aGFua3Mh
CgpSZWdhcmRzClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
